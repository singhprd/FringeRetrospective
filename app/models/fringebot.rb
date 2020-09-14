# frozen_string_literal: true

require "festivals_lab"
# api.events # The first page of events (using the API's default of 25 per page)

# puts api.events(festival: 'book', size: 50, from: 100)
# puts api.events(festival: 'fringe', post_code: 'EH1', price_to: 5)
# puts api.events(title: "'Dino Day'").count

class Fringebot
  FESTIVALS = {
    all: { code: "", full: "All Festivals" },
    fringe: { code: "fringe", full: "Edinburgh Festival Fringe" },
    # :demofringe => {:code => "demofringe", :full =>"Edinburgh Festival Fringe (DEMO)"},
    jazz: { code: "jazz", full: "Edinburgh Jazz & Blues Festival" },
    book: { code: "book", full: "Edinburgh International Book Festival" },
    international: { code: "international", full: "Edinburgh International Festival" },
    tattoo: { code: "tattoo", full: "Royal Edinburgh Military Tattoo" },
    art: { code: "art", full: "Edinburgh Art Festival" },
    hogmanay: { code: "hogmanay", full: "Edinburgh's Hogmanay" },
    science: { code: "science", full: "Edinburgh International Science Festival" },
    imaginate: { code: "imaginate", full: "Edinburgh International Children's Festival" },
    film: { code: "film", full: "Edinburgh International Film Festival" },
    mela: { code: "mela", full: "Edinburgh Mela" },
    storytelling: { code: "storytelling", full: "Edinburgh International Storytelling Festival" },
  }.freeze

  YEARS = %w[2017 2018 2019].freeze

  def initialize(my_hash)
    @params = my_hash
    @api = FestivalsLab.new(
      ENV["FRINGE_API_KEY"],
      ENV["FRINGE_SECRET_KEY"],
    )
  end

  def self.festival_options_for_select
    FESTIVALS.map do |_key, value|
      [value[:full], value[:code]]
    end
  end

  def single_event
    params = @api.event(@params["uuid"])
    find_or_create_venue_and_event(params)
  end

  def put_in_quotes(string)
    return "\"#{string}\"" unless string.empty?
  end

  def query_api
    query_params = {
      title: put_in_quotes(@params["title_string"]),
      festival: @params["festival_string"],
      year: @params["year"],
      artist: put_in_quotes(@params["artist"]),
      code: @params["code"],
    }

    # Delete nil values passed from search form
    query_params.delete_if { |_k, v| v.nil? || v.empty? }

    # Use festivals_lab to actually search the api
    @api.events(
      query_params,
    )
  end

  def get_events
    api_response = query_api
    events = []
    api_response.each do |params|
      events << find_or_create_venue_and_event(params)
    end
    events.each(&:reload)
    events
  end

  def find_or_create_venue_and_event(params)
    # Venue
    venue = create_or_find_venue(params)

    # Event
    event = create_or_find_event(params)

    # Assign Venue to event if not already assigned
    event.update_attributes!(venue: venue)

    # Images
    create_images(params, event)

    create_performances(params, event)

    event
  end

  def create_performances(params, event)
    perf_params = create_performances_params_array(params)
    performances = []

    perf_params.each do |perf_param|
      performance = Performance.create(perf_param)
      performance.update_attributes(event_id: event.id)
      performances << performance
    end

    performances
  end

  def create_images(params, event)
    return if params["images"].nil?

    event.images.destroy_all
    params["images"].each do |image_params|
      image_params = image_params.last
      image = Image.new
      image.image_hash = image_params["hash"]
      image.image_type = image_params["type"]
      image.orientation = image_params["orientation"]
      image.event = event
      image.save!

      image_params["versions"].each do |version_params|
        version_params = version_params.second
        img_ver = ImageVersion.new
        img_ver.height = version_params["height"]
        img_ver.width = version_params["width"]
        img_ver.mime = version_params["mime"]
        img_ver.url = version_params["url"]
        img_ver.image_type = version_params["type"]
        img_ver.image = image
        img_ver.save!
      end
    end
  end

  # def performances(event_id)
  #   params = @api.event(@params["uuid"])
  #   perf_params = create_performances_params_array(params)
  #   performances = []

  #   perf_params.each do |perf_param|
  #     performance = Performance.create(perf_param)
  #     performance.update_attributes(event_id: event_id)
  #     performances << performance
  #   end

  #   performances
  # end

  def create_or_find_venue(params)
    params = create_venue_params(params)
    venue = Venue.find_by_code(params["code"])
    if venue.present?
      update(venue, params)
    else
      venue = Venue.create!(params)
    end
    venue
  end

  def update(thing, new_params)
    # Thing can be Event or Venue or Peformance
    # Check if the API has updated the thing since
    # the last time the app has updated the thing
    # return if thing.updated.to_datetime < thing.updated_at
    thing.update_attributes(new_params)
    thing
  end

  def create_or_find_event(params)
    params = create_event_params(params)
    event = Event.find_by_code(params["code"])
    if event.present?
      update(event, params)
    else
      event = Event.create!(params.merge(festival_year: @params["year"]))
    end

    event
  end

  def create_event_params(result)
    result.slice(
      "age_category",
      "artist",
      "code",
      "description",
      "festival",
      "festival_id",
      "genre",
      "latitude",
      "longitude",
      "status",
      "title",
      "updated",
      "url",
      "website",
      "score",
    )
  end

  def create_venue_params(result)
    result = result["venue"]
    result.slice(
      "address",
      "box_office_fringe",
      "box_office_opening",
      "cafe_description",
      "code",
      "email",
      "fax",
      "has_bar",
      "has_booking_over_card",
      "has_booking_over_phone",
      "has_booking_over_web",
      "has_cafe",
      "name",
      "phone",
      "lat",
      "lon",
      "post_code",
      "web_address",
    )
  end

  def create_performances_params_array(result)
    @raw_array = result["performances"]
    @performance_hashes = @raw_array.each do |perf_hash|
      perf_hash.slice("concession", "end", "start", "price")
      perf_hash[:end_time] = perf_hash.delete("end")
      perf_hash[:start_time] = perf_hash.delete("start")
    end
    @performance_hashes
  end
end

# frozen_string_literal: true

class Review < ApplicationRecord
  require "net/https"
  require "uri"
  require "json"
  require "rubygems"
  require "readability"
  require "open-uri"
  belongs_to :event
  validates :search_engine_content, presence: true

  def get_or_build_review(source, event_id)
    existing_review = Review.where(event_id: event_id, source: source).last
    return existing_review if existing_review

    self.event_id = event_id
    self.source = source

    event = Event.find(event_id)
    query_bing_for_review("#{event.title} #{event.festival_year}", source)
  end

  def query_bing_for_review(search_keywords, source)
    # https://api.cognitive.microsoft.com/bing/v7.0/suggestions
    # https://api.cognitive.microsoft.com/bing/v7.0/entities
    # https://api.cognitive.microsoft.com/bing/v7.0/images
    # https://api.cognitive.microsoft.com/bing/v7.0/news
    # https://api.cognitive.microsoft.com/bing/v7.0/spellcheck
    # https://api.cognitive.microsoft.com/bing/v7.0/videos
    # https://api.cognitive.microsoft.com/bing/v7.0
    # Key 1: aa76ff5e04ec4adaa056d822fb88de6b
    # Key 2: 500c4584454240a4a52b3a1426b12f4a

    accessKey = "aa76ff5e04ec4adaa056d822fb88de6b"

    # Verify the endpoint URI.  At this writing, only one endpoint is used for Bing
    # search APIs.  In the future, regional endpoints may be available.  If you
    # encounter unexpected authorization errors, double-check this value against
    # the endpoint for your Bing Web search instance in your Azure dashboard.

    uri  = "https://api.cognitive.microsoft.com"
    path = "/bing/v7.0/search"

    term = search_keywords
    responseFilter = "Webpages"
    answerCount = "1"
    count = "1"

    built_url = uri + path + "?q=" + URI.escape(term) + "+site:#{source}" + "&responseFilter=" + responseFilter + "&answerCount=" + answerCount + "&count=" + count
    uri = URI(built_url)

    request = Net::HTTP::Get.new(uri)
    request["Ocp-Apim-Subscription-Key"] = accessKey

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
      http.request(request)
    end

    response = JSON(response.body)

    if response["webPages"].nil? || doesnt_mention_review(response)
      self.has_data = false
      self.search_engine_content = response.to_json
    else
      result = response["webPages"]["value"].first
      self.search_engine_content = response.to_json
      self.has_data = true
      self.url = result["url"]
      self.content = result["snippet"]
      self.title = result["name"]
    end

    save!
    self
  end

  def doesnt_mention_review(response)
    # response.downcase.include?("review")
  end
end

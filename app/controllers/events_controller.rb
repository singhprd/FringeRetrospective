require 'json'
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:destroy, :update, :edit]
  protect_from_forgery with: :null_session

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  def votes
    set_event
    vote_tally = @event.tally_votes
    render json: {votes: vote_tally}
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # GET /events/1/is_favourited
  def is_favourited
    result = Event.favourited?(current_user, params[:event_id])
    render json: {bool: result}
  end

  # POST /events
  # POST /events.json
  def create
    # This is quite insecure as I'm trusting the API too much - Fix it later TM
    # venue_params = JSON.parse(event_params[:venue])
    # venue_params = eval params[:venue]

    if params[:existing_venue_code].nil? 
      # FIXME: Security thing
      venue_params = eval(params[:venue])

      @venue = Venue.new(venue_params)
      @venue.save
    else
      @venue = Venue.find_by_code(params[:existing_venue_code])
    end
    @event = Event.new(event_params)
    @event.venue = @venue

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def performances()
    set_event
    render json: @event.performances_json
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      @event.check_for_updates
      return @event
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.permit(:event, :code, :age_category, :artist, :code, :description, :festival, :festival_id, :genre, :latitude, :longitude, :status, :title, :updated, :url, :address, :name, :phone, :post_code, :website)
    end
end

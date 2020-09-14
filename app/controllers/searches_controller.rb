# frozen_string_literal: true

class SearchesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_event, only: %i[show edit update destroy]

  def new
    if !current_user.nil? && current_user.searches.last.present?
      redirect_to current_user.searches.last
    end

    # Search defaults
    @search_params = { "title_string" => "", "artist" => "", "year" => "2018", "festival_string" => "fringe" }
  end

  def create
    @search = Search.new(search_params.to_hash, current_user)
    @search.update(user: current_user)
    @events = @search.events
    redirect_to @search
  end

  def show
    @search_params = @search.retrieve_params
    @events = @search.events
    @events = Kaminari.paginate_array(@events).page(params[:page]).per(5)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params.permit("title_string", "artist", "year", "festival_string")
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @search = Search.find(params[:id])
   end
end

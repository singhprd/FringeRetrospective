# frozen_string_literal: true

class HomeController < ApplicationController
  # TODO: Add Scopes

  # # GET /
  # def welcome
  #   # binding.pry
  #   params[:favourites] ||= 'false'
  #   params[:year] ||= Fringebot::YEARS.last

  #   @filter = params.permit(:favourites, :year, :controller, :action)

  #   events_data = Event.where(festival_year: params[:year])
  #                      .order(score: :desc)

  #   if params[:favourites] == 'true' && current_user.nil?
  #     render 'common/sign_in_to'
  #   elsif params[:favourites] == 'true'
  #     events_data = events_data.select do |e|
  #       Event.favourited?(current_user, e.id)
  #     end
  #     events_data = Kaminari.paginate_array(events_data)
  #   end

  #   @events = events_data.page(params[:page]).per(5)
  # end

  # def search
  #   search_params = {
  #     'title_string' => params["term"],
  #     'artist' => '',
  #     'year' => params["year"],
  #     'festival_string' => ''
  #   }

  #   params[:favourites] ||= 'false'
  #   params[:year] ||= Fringebot::YEARS.last

  #   @filter = params.permit(:favourites, :year, :controller, :action, :term)

  #   @search = Search.new(search_params.to_hash, current_user)
  #   @search.update(user: current_user)
  #   # @events = @search.events
  #   # redirect_to @search
  #   # @search_params = @search.retrieve_params
  #   # @events = @search.events
  #   # @events = Kaminari.paginate_array(@search.events)
  #   @events = @search.events.page(params[:page]).per(5)

  #   # binding.pry

  #   # @events = Kaminari.paginate_array(@events).page(params[:page]).per(5)
  #   # @events = @search.events
  #   render "home/welcome.html.erb"
  # end

  def events
    if params[:term]
      search_params = {
        "title_string" => params["term"],
        "year" => params["year"],
        "artist" => "",
        "festival_string" => "",
      }

      params[:favourites] ||= "false"
      params[:year] ||= Fringebot::YEARS.last

      @filter = params.permit(:favourites, :year, :controller, :action, :term)
      @search = Search.new(search_params.to_hash, current_user)
      @search.update(user: current_user)
      @events = @search.events.page(params[:page]).per(5)
      render "home/welcome.html.erb"
    else
      year = params[:year]

      events_data = Event.where(festival_year: year).order(score: :desc)
      events_data = Kaminari.paginate_array(events_data)

      @events = events_data.page(params[:page]).per(5)

      render "home/welcome"
    end
  end

  # def search_params
  #   params.permit('title_string', 'artist', 'year', 'festival_string')
  # end
end

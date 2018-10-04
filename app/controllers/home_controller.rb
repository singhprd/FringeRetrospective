class HomeController < ApplicationController
  # TODO: Add Scopes

  # GET /
  def index
    params[:favourites] ||= "false"
    params[:year] ||= Fringebot::YEARS.last

    @filter = params.permit(:favourites, :year, :controller, :action)

    events_data = Event.where(festival_year: params[:year])
                   .order(score: :desc)

    if params[:favourites] == "true" && current_user.nil?
      render "common/sign_in_to"
    elsif params[:favourites] == "true"
      events_data = events_data.select do |e|
        Event.favourited?(current_user, e.id)
      end
      events_data = Kaminari.paginate_array(events_data)
    end

    @events = events_data.page(params[:page]).per(5)
  end
end

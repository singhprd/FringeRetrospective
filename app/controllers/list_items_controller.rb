class ListItemsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    li = ListItem.new

    li.event_id = params[:event_id]
    li.list_id = params[:list_id]

    li.save!

    render :template => "home/_list_buttons.html.erb", :layout => false
  end

  def destroy
    li = ListItem.find(params[:id])
    @event = Event.find(li.event_id)

    li.destroy
    render :template => "home/_list_buttons.html.erb", :layout => false
  end
end

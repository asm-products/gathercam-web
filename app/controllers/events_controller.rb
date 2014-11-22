class EventsController < ApplicationController
  def show
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params.merge(user_id: session[:user_id]))
  end

  def event_params
    params.require(:event).permit(:title, :slug)
  end
end

class EventsController < ApplicationController
  def show
    @event = Event.find_by(slug: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params.merge(user_id: session[:user_id]))
    redirect_to event_path(@event)
  end

  def event_params
    params.require(:event).permit(:title, :slug)
  end
end

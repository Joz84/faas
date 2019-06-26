class EventsController < ApplicationController
  def create
    @batch = Batch.last
    @event = @batch.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      @events = Event.all
      @activities = Activity.all
      render "users/dashboard"
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :content,
      :date,
      :link,
      :address,
      :city,
      :country
    )
  end
end

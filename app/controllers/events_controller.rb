class EventsController < ApplicationController
  def create
    @batch = Batch.find_by(number: "#290")
    @event = @batch.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      @battle = Battle.new
      @activity = Activity.new
      @activities = Activity.all
      @events = Event.all

      @batch_events = Event.where(batch: @batch)
      @batch_battles = Battle.where(batch: @batch)

      @schedule = @batch_events + @batch_battles
      @timeline_schedule = @schedule.sort_by(&:date)
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

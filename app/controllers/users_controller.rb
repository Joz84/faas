class UsersController < ApplicationController
  def dashboard
    @batch = Batch.where(number: "#290")
    @activity = Activity.new
    @event = Event.new
    @activities = Activity.all
    @events = Event.all

    @batch_events = Event.where(batch: @batch)
    @batch_battles = Battle.where(batch: @batch)

    @schedule = @batch_events + @batch_battles
    @timeline_schedule = @schedule.sort_by(&:date)

  end

  def fouss
  end
end

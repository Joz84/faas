class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to root_path
    else
      @battle = Battle.new
      @batch = Batch.find_by(number: "#290")
      @event = Event.new
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

  def activity_params
    parameters = params.require(:activity).permit(
      :name,
      :link,
      :address,
      :city,
      :country,
      :target
    )
    parameters[:target] = parameters[:target].to_i
    parameters
  end
end

class ActivitiesController < ApplicationController
  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to root_path
    else
      @events = Event.all
      @activities = Activity.all
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

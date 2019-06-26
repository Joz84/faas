class UsersController < ApplicationController
  def dashboard
    @activity = Activity.new
    @event = Event.new
    @activities = Activity.all
    @events = Event.all
  end
end

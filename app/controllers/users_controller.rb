class UsersController < ApplicationController
  def dashboard
    @activity = Activity.new
    @activities = Activity.all
  end
end

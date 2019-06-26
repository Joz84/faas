class BattlesController < ApplicationController

  def create
    @batch = Batch.find_by(number: "#290")
    @battle = Battle.new(battle_params)
    @battle.batch = @batch
    if @battle.save
      flash[:notice] = 'Successfully created battle.'

      redirect_to root_path
    else

      @activity = Activity.new
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

  def battle_params
    params.require(:battle).permit(:date, :deadline, choices_attributes: [:id, :activity, :activity_id, :_destroy])
  end

end

class ChoicesController < ApplicationController
  def update
    @choice = Choice.find(params[:id])
    @choice.vote = @choice.vote.to_i + 1
    @choice.save
    redirect_to root_path
  end
end

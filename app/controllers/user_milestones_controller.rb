class UserMilestonesController < ApplicationController
  def tasks
    render json: Task.where(user_milestone_id: params[:user_milestone_id])
  end
end

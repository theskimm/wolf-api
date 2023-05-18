class UsersController < ApplicationController
  def user_journeys
    render json: UserJourney.where(user_id: params[:user_id])
  end
end

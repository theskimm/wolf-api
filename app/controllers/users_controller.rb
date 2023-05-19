class UsersController < ApplicationController
  def user_journeys
    user_journeys = UserJourney.where(user_id: params[:user_id])

    output = []
    user_journeys.each do |uj|
      output << {
        id: uj.id,
        created_at: uj.created_at,
        updated_at: uj.updated_at,
        user_id: uj.user_id,
        journey_id: uj.journey_id,
        name: Journey.find_by!(id: uj.journey_id).name
      }
    end

    render json: output
  end
end

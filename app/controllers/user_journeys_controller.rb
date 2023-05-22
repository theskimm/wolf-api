class UserJourneysController < ApplicationController
  def create
    user = User.find_by!(id: params[:user_id])

    journey =
      if params[:journey_override]
        Journey.create(name: params[:journey_override])
      else
        Journey.find_by!(id: params[:journey_id])
      end


    roadmap = BotClient.generate_roadmap(user, journey)

    uj = UserJourney.create(journey_id: journey.id, user_id: user.id)
    todo_status = Status.find_by!(name: 'To Do')

    roadmap[:milestones].each do |milestone|
      m = UserMilestone.create(name: milestone[:title], user_journey_id: uj.id, status_id: todo_status.id)
      milestone[:tasks].each do |task|
        Task.create(name: task[:title], status_id: todo_status.id,
                    description: task[:description], user_milestone_id: m.id,
                    effort: rand(1..5))
      end
    end

    render json: roadmap
  end

  def milestones
    render json: UserMilestone.where(user_journey_id: params[:user_journey_id])
  end
end

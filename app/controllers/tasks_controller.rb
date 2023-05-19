class TasksController < ApplicationController
  def update
    # TODO: Update task status
  end

  def curated_tasks
    u_journey = UserJourney.find_by!(id: params[:user_journey_id])
    todo_status = Status.find_by!(name: 'To Do')
    u_milestones = UserMilestone.where(user_journey_id: u_journey.id, status_id: todo_status.id)

    tasks = Task.where(status_id: todo_status.id, effort: params[:effort_levels], user_milestone_id: u_milestones)
                .limit(params[:num_tasks])

    output = []
    tasks.each do |t|
      output << {
        name: t.name,
        description: t.description,
        contentful_id: BotClient.get_latest_content_for_task(t),
        effort: t.effort,
        user_milestone_id: t.user_milestone_id
      }
    end

    fake_data = [
      {
        name: 'Watch Video ABC',
        description: 'This video will teach you XYZ.',
        contentful_id: "asdf1234",
        effort: 1,
        user_milestone_id: 2
      },
      {
        name: 'Call your parent',
        description: 'Remember to remain calm!',
        contentful_id: "lkjfdsa",
        effort: 3,
        user_milestone_id: 3
      }
    ]

    render json: output
  end
end

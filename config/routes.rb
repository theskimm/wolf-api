Rails.application.routes.draw do
  post 'curated_tasks/:user_journey_id' => 'tasks#curated_tasks'
  put 'tasks/:task_id' => 'tasks#update'

  post 'user_journeys/:user_id/:journey_id' => 'user_journeys#create'

  get 'user_journeys/:user_journey_id/milestones' => 'user_journeys#milestones'
  get 'user_milestones/:user_milestone_id/tasks' => 'user_milestones#tasks'
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

task_types = [
  {name: 'Audio'},
  {name: 'Read'},
  {name: 'Video'},
  {name: 'Interactive'}
]

task_types.each { |tt| TaskType.find_or_create_by(tt) }

statuses = [
  {name: 'To Do'},
  {name: 'Skipped'},
  {name: 'Done'},
  {name: 'Removed'}
]

statuses.each { |s| Status.find_or_create_by(s) }

journeys = [
  {name: "Parents' wellbeing"},
  {name: 'Moving out of the nest'},
  {name: 'Making new friends'},
]

journeys.each { |j| Journey.find_or_create_by(j) }

parents_journey = Journey.find_by(name: "Parents' wellbeing")

milestones = [
  {name: "Getting started", journey_id: parents_journey.id},
  {name: "Financial plan", journey_id: parents_journey.id},
  {name: "Power of attorney", journey_id: parents_journey.id},
  {name: "Legal documents", journey_id: parents_journey.id},
  {name: "Long-term care options", journey_id: parents_journey.id},
  {name: "Financial assistance programs", journey_id: parents_journey.id},
  {name: "Update insurance coverage", journey_id: parents_journey.id},
  {name: "Medical check-ups", journey_id: parents_journey.id},
  {name: "Support network", journey_id: parents_journey.id},
  {name: "Be supportive", journey_id: parents_journey.id}
]

milestones.each { |m| Milestone.find_or_create_by(m) }

users = [
  {name: 'Darcy', birthdate: '4/12/1989', city: 'St. Louis', state: 'MO', email: 'dink@gmail.com'},
  {name: 'Becca', birthdate: '20/10/1989', city: 'Brooklyn', state: 'NY', email: 'burntout@gmail.com'},
  {name: 'Lena', birthdate: '5/5/1996', city: 'Rockville', state: 'MD', email: 'lessthancertain@gmail.com'}
]

users.each { |u| User.find_or_create_by(u) }

darcy = User.find_by(name: 'Darcy')

darcys_journey = UserJourney.create(user_id: darcy.id, journey_id: parents_journey.id)

parents_milestones = Milestone.where(journey_id: parents_journey.id)
todo_status = Status.find_by(name: 'To Do')

parents_milestones.each do |pm|
  UserMilestone.create(user_journey_id: darcys_journey.id, milestone_id: pm.id, status_id: todo_status.id)
end

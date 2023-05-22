# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

users = [
  {name: 'Darcy', birthdate: '4/12/1989', city: 'St. Louis', state: 'MO', email: 'dink@gmail.com'},
  {name: 'Becca', birthdate: '20/10/1989', city: 'Brooklyn', state: 'NY', email: 'burntout@gmail.com'},
  {name: 'Lena', birthdate: '5/5/1996', city: 'Rockville', state: 'MD', email: 'lessthancertain@gmail.com'}
]

users.each { |u| User.find_or_create_by(u) }

darcy = User.find_by(name: 'Darcy')

darcys_journey = UserJourney.create(user_id: darcy.id, journey_id: parents_journey.id)
todo_status = Status.find_by(name: 'To Do')

milestones = [
  {name: "Getting started", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Financial plan", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Power of attorney", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Legal documents", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Long-term care options", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Financial assistance programs", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Update insurance coverage", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Medical check-ups", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Support network", user_journey_id: darcys_journey.id, status_id: todo_status.id},
  {name: "Be supportive", user_journey_id: darcys_journey.id, status_id: todo_status.id}
]

milestones.each { |m| UserMilestone.find_or_create_by(m) }

tasks = [
  {name: "Watch video A", description: "You will learn X", user_milestone_id: 1, effort: 1, status_id: 1},
  {name: "Watch video B", description: "You will learn Y", user_milestone_id: 2, effort: 2, status_id: 1},
  {name: "Watch video C", description: "You will learn Z", user_milestone_id: 4, effort: 3, status_id: 1}
]

tasks.each { |t| Task.find_or_create_by(t) }

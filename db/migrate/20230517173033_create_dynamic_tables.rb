class CreateDynamicTables < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.timestamp :birthdate
      t.string :city
      t.string :state

      t.timestamps
    end

    create_table :user_journeys do |t|
      t.timestamps
    end

    add_reference(:user_journeys, :user, foreign_key: true)
    add_reference(:user_journeys, :journey, foreign_key: true)

    create_table :user_milestones do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_reference(:user_milestones, :user_journey, foreign_key: true)
    add_reference(:user_milestones, :status, foreign_key: true)

    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :effort, null: false

      t.timestamps
    end

    add_reference(:tasks, :user_milestone, foreign_key: true)
    add_reference(:tasks, :status, foreign_key: true)
  end
end

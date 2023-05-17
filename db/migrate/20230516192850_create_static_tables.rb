class CreateStaticTables < ActiveRecord::Migration[6.1]
  def change
    # Journeys are static
    create_table :journeys do |t|
      t.string :name, null: false

      t.timestamps
    end

    # Milestones are static
    create_table :milestones do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference(:milestones, :journey, foreign_key: true)

    # Statuses are static
    create_table :statuses do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

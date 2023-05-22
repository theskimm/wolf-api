class CreateStaticTables < ActiveRecord::Migration[6.1]
  def change
    # Journeys are static
    create_table :journeys do |t|
      t.string :name, null: false

      t.timestamps
    end

    # Statuses are static
    create_table :statuses do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

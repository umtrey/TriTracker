class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.integer :activity_id
      t.date :workout_on
      t.integer :minutes_elapsed
      t.float :units_completed
      t.string :unit_of_measure

      t.timestamps
    end
  end
end

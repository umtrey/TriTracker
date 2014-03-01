class AddActivities < ActiveRecord::Migration
  def up
    Activity.create(name: "Run")
    Activity.create(name: "Walk")
    Activity.create(name: "Bike")
    Activity.create(name: "Swim")
    Activity.create(name: "Workout")
    Activity.create(name: "Yoga")
  end

  def down
    Activity.delete_all
  end
end

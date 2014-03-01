class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates :user, presence: true
  validates :activity, presence: true



  validates :workout_on, presence: true
  validates :minutes_elapsed, numericality: { only_integer: true,
                                              greater_than: 0,
                                              allow_nil: true }
  validates :units_completed, numericality: { greater_than: 0,
                                              allow_nil: true }

  validates_with WorkoutDurationValidator
  validates_with WorkoutDistanceValidator



end

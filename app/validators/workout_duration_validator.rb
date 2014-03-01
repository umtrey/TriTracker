class WorkoutDurationValidator < ActiveModel::Validator
  def validate(record)
    if (record.minutes_elapsed.nil? || record.minutes_elapsed == 0) &&
         (record.units_completed.nil? || record.units_completed == 0)
      record.errors[:base] << "Workout must have a duration or distance."
    end
  end
end

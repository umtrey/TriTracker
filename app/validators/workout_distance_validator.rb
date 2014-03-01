class WorkoutDistanceValidator < ActiveModel::Validator
  def validate(record)
    if record.units_completed &&
         record.units_completed > 0 &&
         record.unit_of_measure.nil?
      record.errors[:base] << "Workout distance must have a unit of measure."
    end
  end
end

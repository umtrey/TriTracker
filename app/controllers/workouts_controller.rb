class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @workouts = current_user.workouts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end

  def new
    @workout = Workout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout }
    end
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workouts_path, notice: 'Workout added!' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new", alert: @workout.errors }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def workout_params
    params.required(:workout).permit(:activity_id, :workout_on,
                                     :minutes_elapsed, :units_completed,
                                     :unit_of_measure)
  end
end

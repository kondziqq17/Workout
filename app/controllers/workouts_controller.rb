class WorkoutsController < ApplicationController

def index
end

def new
	@workout = Workout.new
end

def create
	@workout = Workout.new(workout_params)
end

private

def workout_params
	params.require(:workout).permit(:title, :description, :author)
end
end
class WorkoutsController < ApplicationController
	before_action :find_workout, only: [:show, :edit, :update, :destroy]

def index
	if params[:category].blank?
		@workouts = Workout.all.order("created_at DESC")
	else
		@category_id = Category.find_by(name: params[:category]).id
		@workouts = Workout.where(:category_id => @category_id).order("created_at DESC")
	end
end

def show
	if @workout.reviews.blank?
		@average_review = 0
	else
		@average_review = @workout.reviews.average(:rating).round(2)
	end
end

def new
	@workout = current_user.workouts.build
	@categories = Category.all.map{ |c| [c.name, c.id]}
end

def create
	@workout = current_user.workouts.build(workout_params)
	@workout.category_id = params[:category_id]

	if @workout.save
		redirect_to root_path
	else
		render 'new'
	end
end

def edit
	@categories = Category.all.map{ |c| [c.name, c.id]}
end

def update
	@workout.category_id = params[:category_id]
	if @workout.update(workout_params)
		redirect_to workout_path(@workout)
	else
		render 'edit'
	end
	end

def destroy
	@workout.destroy
	redirect_to root_path
end

private

def workout_params
	params.require(:workout).permit(:title, :description, :author, :category_id, :workout_img)
end

def find_workout
	@workout = Workout.find(params[:id])
end
end
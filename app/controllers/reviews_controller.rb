class ReviewsController < ApplicationController
	before_action :find_workout
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new	
	end

	def create
		@review = Review.new(review_params)
		@review.workout_id = @workout.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to workout_path(@workout)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to workout_path(@workout)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to workout_path(@workout)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_workout
			@workout = Workout.find(params[:workout_id])
			end

		def find_review
			@review = Review.find(params[:id])
		end
	end
&copy;
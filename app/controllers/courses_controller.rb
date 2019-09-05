class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
	end

	def show
		@course = Course.find(params[:id])
	end

	def create
	end

	private

	def course_params
		params.require(:course).permit(:title, :descrition, :cost, :image)
	end
end
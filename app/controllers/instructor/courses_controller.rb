class Instructor::CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_course, only: [:show]

	def new
		@course = Course.new
		@image = Image.new
	end

	def create
		@course = current_user.courses.create(course_params)
		if @course.valid?
			redirect_to instructor_course_path(@course)
		else
			render :new, status: :unprocessable_entity
		end

		@image = Image.find(params[:image_id])
		@course.image.create(image_params.merge(user: current_user))
		redirect_to image_path(@image)
		
	end

	def show
	end

	private

	def require_authorized_for_current_course
		if current_course.user != current_user
			render plain: "Unathorized", status: :unauthorized
		end
	end

	helper_method :current_course
	def current_course
		@current_course ||= Course.find(params[:id])
	end

	def course_params
		params.require(:course).permit(:title, :description, :cost)
	end
end

class CoursesController < ApplicationController
  include CoursesRights
  before_action :set_course, only: %i[show edit update destroy change_role]
  before_action :verify_organizer, only: %i[destroy]
  before_action :verify_moderators, only: %i[edit update change_role]

  def index
    @courses = Course.all
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      CourseUser.create(course_id: @course.id, user_id: current_user.id, role: 'organizer')
      redirect_to @course
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course has been edited'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to root_path
  end

  def change_role
    @course_user = @course.course_users.find_by(id: params[:course_user_id])
    if @course_user.role == 'participant'
      @course_user.update(role: 'instructor')
      redirect_to course_path(@course)
    else
      @course_user.update(role: 'participant')
      redirect_to course_path(@course)
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :status, :address, :latitude, :longitude)
  end
end

class LessonsController < ApplicationController
  include CoursesRights
  before_action :set_course
  before_action :set_lesson, only: %i[show edit update destroy]
  before_action :check_course_status, except: %i[show]
  before_action :verify_moderators, except: %i[show]

  def show; end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = params[:course_id]
    if @lesson.save
      create_check_ins
      redirect_to @course, notice: "Lesson #{@lesson.theme} has been created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to @course, notice: "Lesson #{@lesson.theme} has been edited"
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to course_path(@course)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def create_check_ins
    @course_users = @course.course_users.confirmed_participant
    @course_users.each do |course_user|
      @lesson.check_ins.create(user_id: course_user.user.id)
    end
  end

  def lesson_params
    params.require(:lesson).permit(:theme, :description, :time, :picture)
  end
end

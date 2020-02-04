class LessonsController < ApplicationController
  before_action :set_course
  before_action :set_lesson, only: %i[show edit update destroy]

  def index
    @lessons = Lesson.where(course_id: params[:course_id])
  end

  def show; end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.course_id = params[:course_id]
    if @lesson.save
      redirect_to @course
    else
      render :new
    end
  end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to @course
      flash[:success] = 'Lesson has been edited'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to root_path
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:theme, :description, :time)
  end

end

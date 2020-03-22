class TasksController < ApplicationController
  before_action :set_course, :set_lesson
  def create
    @task = @lesson.tasks.create(tasks_params)
    redirect_to course_path(@course)
  end

  def destroy
    @task = @lesson.tasks.find(params[:id])
    @task.destroy
    redirect_to course_path(@course)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :body)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end

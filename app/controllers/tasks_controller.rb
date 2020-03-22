class TasksController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:lesson_id])
    @task = @lesson.tasks.create(tasks_params)
    redirect_to course_path(@course)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :body)
  end

end

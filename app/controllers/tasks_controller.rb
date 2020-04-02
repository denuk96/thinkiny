class TasksController < ApplicationController
  before_action :set_course, :set_lesson
  before_action :set_task, except: %i[create change_status]

  def create
    @task = @lesson.tasks.create(tasks_params)
    redirect_to course_path(@course)
  end

  def destroy
    @task.destroy
    redirect_to course_path(@course)
  end

  def change_status
    @task = Task.find(params[:task_id])
    @task.status = !@task.status
    @task.save
    redirect_to course_path(@course)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :body)
  end

  def set_task
    @task = @lesson.tasks.find_by(id: params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:lesson_id])
  end
end

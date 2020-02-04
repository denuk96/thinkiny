class JoinsController < ApplicationController
  before_action :already_joined?, only: %i[join_to_course]
  before_action :set_course, only: %i[join_to_course]

  def join_to_course
    @course_user = CourseUser.new(course_id: @course.id, user_id: current_user.id)
    if @course_user.save
      redirect_to courses_path, notice: 'joined'
    else
      redirect_to courses_path, alert: 'smth went wrong'
    end
  end

  private

  def already_joined?
    if CourseUser.find_by(course_id: params[:id], user_id: current_user.id).present?
      redirect_to courses_path, alert: 'already joined'
    end
  end

  def set_course
    @course = Course.find(params[:id])
  end
end

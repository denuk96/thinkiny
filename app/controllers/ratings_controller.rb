class RatingsController < ApplicationController
  before_action :set_course_user, only: %i[edit update]
  before_action :already_rated?, only: %i[edit update]

  def edit
    render :'ratings/_form'
  end

  def update
    if @course_user.update(course_rating: params[:course_user][:course_rating])
      # user = @course.course_user.find_by(role: '')

      redirect_to root_path, notice: 'saved'
    else
      render :'ratings/_form'
    end
  end

  private

  def already_rated?
    redirect_to root_path, alert: 'You are already rated this course' if @course_user.course_rating.present?
  end

  def set_course_user
    @course_user = CourseUser.find_by(user_id: current_user.id, course_id: params[:course_id], completed: true)
    @course = Course.find_by(id: params[:course_id])
  end
end
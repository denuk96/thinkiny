class RatingsController < ApplicationController
  before_action :set_course_user, only: %i[edit update]
  before_action :course_completed?, only: %i[edit update]
  before_action :already_rated?, only: %i[edit update]

  def edit
    render :'ratings/_form'
  end

  def update
    if @course_user.update(course_rating: params[:course_user][:course_rating])
      organizer = @course.course_users.find_by(role: 'organizer').user
      instructors = @course.course_users.where(role: 'instructor')
      case params[:course_user][:course_rating].to_i
      when 5
        organizer.rating += 20
        instructors.each { |i| i.user.rating += 10; i.user.save }
      when 4
        organizer.rating += 10
        instructors.each { |i| i.user.rating += 5; i.user.save }
      else
        organizer.rating -= 10
        instructors.each { |i| i.user.rating -= 5; i.user.save }
      end
      organizer.save

      redirect_to root_path, notice: 'saved'
    else
      render :'ratings/_form'
    end
  end

  private

  def set_course_user
    @course_user = CourseUser.find_by(user_id: current_user.id, course_id: params[:course_id],
                                      completed: true, role: 'participant')
    @course = Course.find_by(id: params[:course_id])
  end

  def already_rated?
    redirect_to root_path, alert: 'You are already rated this course' if @course_user.course_rating.present?
  end

  def course_completed?
    redirect_to root_path, alert: 'Course is not completed' unless @course.status == 'completed'
  end
end

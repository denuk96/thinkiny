class JoinsController < ApplicationController
  include CoursesRights
  include CheckInsChecker
  before_action :set_course, only: %i[join_to_course]
  before_action :check_course_status, only: %i[join_to_course]
  before_action :already_joined?, only: %i[join_to_course]
  before_action :has_places?, only: %i[join_to_course]

  def join_to_course
    @course_user = @course.course_users.create(user_id: current_user.id, role: 'participant',
                                               confirmed: !@course.pre_moderation)
    if @course_user.confirmed
      flash[:notice] = 'Automatically joined'
      check_ins_create(@course_user.course.lessons, @course_user)
    else
      flash[:notice] = 'Request leaved'
    end
    redirect_to course_path(@course)
  end

  private

  def has_places?
    if (@course.course_users.where(role: 'participant').count >= @course.place_quantities) && !@course.pre_moderation
      redirect_to course_path(@course), alert: 'Course has no available place'
    end
  end

  def already_joined?
    redirect_to course_path(@course) if @course.course_users.find_by(user_id: current_user.id).present?
  end

  def set_course
    @course = Course.find(params[:id])
  end
end

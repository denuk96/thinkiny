class CheckInsController < ApplicationController
  include CoursesRights
  before_action :set_lesson, only: %i[index]
  before_action :set_check_in, only: %i[user_attendance edit update]
  before_action :verify_moderators, only: %i[user_attendance edit update]

  def index
    @lesson.course.users.each do |user|
      if @lesson.check_ins.find_by(user_id: user.id).nil? && check_in_only_for_participant(user)
        @lesson.check_ins.create(user_id: user.id)
      elsif @lesson.check_ins.find_by(user_id: user.id).present? && !check_in_only_for_participant(user)
        @lesson.check_ins.find_by(user_id: user.id).destroy
      end
    end
    @check_ins = @lesson.check_ins.joins(:user).order(email: :asc)
  end

  def user_attendance
    @check_in.attendance = !@check_in.attendance
    @check_in.save
    redirect_to course_lesson_check_ins_path(lesson_id: @check_in.lesson.id)
  end

  def edit; end

  def update
    if @check_in.update_attributes(check_in_params)
      redirect_to course_lesson_check_ins_path(lesson_id: @check_in.lesson.id), notice: 'noted'
    else
      render :edit
    end
  end

  private

  def check_in_only_for_participant(user)
    true if user.course_users.where(course_id: @lesson.course.id, role: 'participant', confirmed: true).present?
  end

  def set_check_in
    @check_in = CheckIn.find_by(id: params[:id])
    @course = @check_in.lesson.course
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:lesson_id])
  end

  def check_in_params
    params.require(:check_in).permit(:note)
  end
end

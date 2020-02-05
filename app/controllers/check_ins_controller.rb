class CheckInsController < ApplicationController
  before_action :set_lesson, only: %i[index]
  before_action :set_check_in, only: %i[user_attendance edit update]

  def index
    @lesson.course.users.each do |user|
      if CheckIn.find_by(user_id: user.id, lesson_id: @lesson.id).nil?
        CheckIn.create(user_id: user.id, lesson_id: @lesson.id)
      end
    end
    @check_ins = @lesson.check_ins
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

  def set_check_in
    @check_in = CheckIn.find_by(id: params[:id])
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:lesson_id])
  end

  def check_in_params
    params.require(:check_in).permit(:note)
  end
end

class CheckInsController < ApplicationController

  def check_in
    @course = Course.find_by(id: params[:course_id])
    @lesson = Lesson.find_by(id: params[:lesson_id])
    @course.users.each do |user|
      CheckIn.create(user_id: user.id, lesson_id: @lesson.id)
    end
    redirect_to check_ins_path(lesson_id: @lesson.id)
  end

  def index
    @lesson = Lesson.find_by(id: params[:lesson_id])
    @check_ins = @lesson.check_ins
  end
end

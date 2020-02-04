class CheckInsController < ApplicationController
  before_action :set_lesson, only: %i[index]

  def index
    @lesson.course.users.each do |user|
      if CheckIn.find_by(user_id: user.id, lesson_id: @lesson.id).nil?
        CheckIn.create(user_id: user.id, lesson_id: @lesson.id)
      end
    end
    @check_ins = @lesson.check_ins
  end

  private

  def set_lesson
    @lesson = Lesson.find_by(id: params[:lesson_id])
  end
end

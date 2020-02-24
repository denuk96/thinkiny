module CheckInsChecker
  include ActiveSupport::Concern

  def check_ins_create(lessons, course_user)
    lessons.each do |lesson|
      if lesson.check_ins.find_by(user_id: course_user.user.id).nil?
        lesson.check_ins.create(user_id: course_user.user.id)
      end
    end
  end

  def check_ins_destroy(lessons, course_user)
    lessons.each do |lesson|
      lesson.check_ins.find_by(user_id: course_user.user.id)&.destroy
    end
  end
end

# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  theme       :string
#  description :text
#  time        :datetime
#  course_id   :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let!(:course) { FactoryGirl.create(:course) }

  context 'validation tests' do
    it 'ensure Lesson theme is valid' do
      lesson = Lesson.new(course_id: course.id, theme: 'test')
      expect(lesson.valid?).to eq(false)
    end

    it 'ensure Lesson description is valid' do
      lesson = Lesson.new(course_id: course.id, description: 'test')
      expect(lesson.valid?).to eq(false)
    end

    it 'ensure Lesson time is valid' do
      lesson = Lesson.new(course_id: course.id, time: 'test')
      expect(lesson.valid?).to eq(false)
    end

    it 'check all lessons validations' do
      lesson = Lesson.new(course_id: course.id,
                          theme: 'test',
                          description: 'test',
                          time: 'Thu, 06 Feb 2020 23:17:23 UTC +00:00')
      expect(lesson.save).to eq(true)
    end
  end
end

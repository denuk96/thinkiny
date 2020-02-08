require 'rails_helper'

RSpec.describe Lesson, type: :model do
  Course.create(id: 1, name: 'test', description: 'test') if Course.find_by(id: 1).nil?

  context 'validation tests' do
    it 'ensure Lesson theme is valid' do
      lesson = Lesson.new(course_id: 1, theme: 'test')
      expect(lesson.valid?).to eq(false)
    end

    it 'ensure Lesson description is valid' do
      lesson = Lesson.new(course_id: 1, description: 'test')
      expect(lesson.valid?).to eq(false)
    end

    it 'ensure Lesson time is valid' do
      lesson = Lesson.new(course_id: 1, time: 'test')
      expect(lesson.valid?).to eq(false)
    end

    it 'check all lessons validations' do
      lesson = Lesson.new(course_id: 1,
                          theme: 'test',
                          description: 'test',
                          time: 'Thu, 06 Feb 2020 23:17:23 UTC +00:00')
      expect(lesson.save).to eq(true)
    end
  end
end

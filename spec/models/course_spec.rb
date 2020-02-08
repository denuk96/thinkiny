require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validation tests' do
    it 'ensure course name is valid' do
      course_test = Course.new(name: 'test')
      expect(course_test.valid?).to eq(false)
    end

    it 'ensure course description is valid' do
      course_test = Course.new(description: 'test')
      expect(course_test.valid?).to eq(false)
    end

    it 'ensure course can be saved' do
      course_test = Course.new(name: 'test', description: 'test')
      expect(course_test.save).to eq(true)
    end
  end
end

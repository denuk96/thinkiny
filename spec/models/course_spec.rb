# == Schema Information
#
# Table name: courses
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :text
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :string
#  latitude         :float
#  longitude        :float
#  pre_moderation   :boolean          default(FALSE)
#  place_quantities :integer          default(9999)
#

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

    it 'ensure course place_quantities is valid' do
      course_test = Course.new(name: 'test', description: 'test', place_quantities: 0)
      expect(course_test.valid?).to eq(false)
    end

    it 'ensure course pre_moderation is valid' do
      course_test = Course.new(name: 'test', description: 'test', pre_moderation: nil)
      expect(course_test.valid?).to eq(false)
    end

    it 'ensure course can be saved' do
      course_test = Course.new(name: 'test', description: 'test', place_quantities: 1)
      expect(course_test.save).to eq(true)
    end
  end
end

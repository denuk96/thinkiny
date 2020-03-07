# == Schema Information
#
# Table name: course_users
#
#  id            :bigint           not null, primary key
#  course_id     :bigint
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  role          :string
#  confirmed     :boolean          default(TRUE)
#  completed     :boolean          default(FALSE)
#  course_rating :integer
#

require 'rails_helper'

RSpec.describe CourseUser, type: :model do
  describe 'validation' do
    let!(:course) { FactoryGirl.create(:course) }
    let!(:user) { FactoryGirl.create(:user_no_admin) }

    it 'should be invalid role' do
      course_user = CourseUser.new(course_id: course.id, user_id: user.id, role: 'wrong role')
      expect(course_user.valid?).to eq(false)
    end

    it 'ensure course_user confirmed is valid' do
      course_user = CourseUser.new(course_id: course.id, user_id: user.id, role: 'participant', confirmed: nil)
      expect(course_user.valid?).to eq(false)
    end

    it 'should be valid' do
      course_user = CourseUser.new(course_id: course.id, user_id: user.id, role: 'participant', confirmed: true)
      expect(course_user.valid?).to eq(true)
    end
  end
end

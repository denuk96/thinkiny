# == Schema Information
#
# Table name: course_users
#
#  id         :bigint           not null, primary key
#  course_id  :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CourseUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

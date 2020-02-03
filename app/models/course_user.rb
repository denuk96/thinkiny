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

class CourseUser < ApplicationRecord
  belongs_to :course
  belongs_to :user
end

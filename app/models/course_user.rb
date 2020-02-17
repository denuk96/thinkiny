# == Schema Information
#
# Table name: course_users
#
#  id         :bigint           not null, primary key
#  course_id  :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :string
#  confirmed  :boolean          default(TRUE)
#

class CourseUser < ApplicationRecord
  COURSE_ROLES = %w[organizer instructor participant].freeze

  belongs_to :course
  belongs_to :user

  validates :role, inclusion: COURSE_ROLES
  validates :confirmed, inclusion: { in: [true, false] }
end

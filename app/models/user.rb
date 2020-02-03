# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  second_name :string
#  admin       :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ApplicationRecord
  has_many :course_users
  has_many :courses, through: :course_users
  has_many :check_ins
  has_many :lessons, through: :check_ins
end

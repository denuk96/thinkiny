class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :course_users
  has_many :courses, through: :course_users
  has_many :check_ins
  has_many :lessons, through: :check_ins

end

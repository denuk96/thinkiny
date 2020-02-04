class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :course_users
  has_many :courses, through: :course_users
  has_many :check_ins
  has_many :lessons, through: :check_ins

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end

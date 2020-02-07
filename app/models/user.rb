# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  first_name                   :string
#  admin                        :boolean          default(FALSE)
#  email                        :string           not null
#  crypted_password             :string
#  salt                         :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  remember_me_token            :string
#  remember_me_token_expires_at :datetime
#  last_name                    :string
#

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

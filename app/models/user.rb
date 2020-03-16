# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  first_name                          :string
#  admin                               :boolean          default(FALSE)
#  crypted_password                    :string
#  salt                                :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  remember_me_token                   :string
#  remember_me_token_expires_at        :datetime
#  last_name                           :string
#  failed_logins_count                 :integer          default(0)
#  lock_expires_at                     :datetime
#  unlock_token                        :string
#  last_login_at                       :datetime
#  last_logout_at                      :datetime
#  last_activity_at                    :datetime
#  last_login_from_ip_address          :string
#  email                               :string
#  activation_state                    :string
#  activation_token                    :string
#  activation_token_expires_at         :datetime
#  reset_password_token                :string
#  reset_password_token_expires_at     :datetime
#  reset_password_email_sent_at        :datetime
#  access_count_to_reset_password_page :integer          default(0)
#  rating                              :integer          default(0)
#

class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :picture, PictureUploader

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users
  has_many :check_ins, dependent: :destroy
  has_many :lessons, through: :check_ins
  has_many :notifications, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :picture, file_size: { less_than: 5.megabytes }

  # Log the Activity
  class << self
    def current_users
      where("#{sorcery_config.last_activity_at_attribute_name} IS NOT NULL") \
      .where("#{sorcery_config.last_logout_at_attribute_name} IS NULL
      OR #{sorcery_config.last_activity_at_attribute_name} > #{sorcery_config.last_logout_at_attribute_name}") \
      .where("#{sorcery_config.last_activity_at_attribute_name} > ? ", sorcery_config.activity_timeout.seconds.ago.utc.to_s(:db))
    end
  end

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
end

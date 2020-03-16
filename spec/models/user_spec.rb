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

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure email  is valid' do
      user = User.new(email: 'blablabla@mail.com')
      expect(user.valid?).to eq(false)
    end

    it 'ensure password is valid' do
      user = User.new(password: 'password', password_confirmation: 'password')
      expect(user.valid?).to eq(false)
    end

    it 'ensure user can be saved' do
      user = User.new(email: 'blablabla@mail.com', password: 'password', password_confirmation: 'password')
      expect(user.valid?).to eq(true)
      expect(user.save).to eq(true)
    end
  end
end

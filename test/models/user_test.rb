# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  first_name                   :string
#  admin                        :boolean          default(FALSE)
#  crypted_password             :string
#  salt                         :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  remember_me_token            :string
#  remember_me_token_expires_at :datetime
#  last_name                    :string
#  failed_logins_count          :integer          default(0)
#  lock_expires_at              :datetime
#  unlock_token                 :string
#  last_login_at                :datetime
#  last_logout_at               :datetime
#  last_activity_at             :datetime
#  last_login_from_ip_address   :string
#  google_calendar_id           :string
#  email                        :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

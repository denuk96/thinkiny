# == Schema Information
#
# Table name: authentications
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  provider   :string           not null
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ApplicationRecord
  # attr_accessible :user_id, :provider, :uid
  belongs_to :user
end

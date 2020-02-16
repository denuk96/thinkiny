# == Schema Information
#
# Table name: courses
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :text
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :string
#  latitude         :float
#  longitude        :float
#  pre_moderation   :boolean          default(FALSE)
#  place_quantities :integer          default(9999)
#

class Course < ApplicationRecord
  geocoded_by :address

  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :lessons

  after_validation :geocode
  validates_presence_of :name, :description
end

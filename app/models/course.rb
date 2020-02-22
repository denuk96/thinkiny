# == Schema Information
#
# Table name: courses
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :text
#  status           :string           default("new")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :string
#  latitude         :float
#  longitude        :float
#  pre_moderation   :boolean          default(FALSE)
#  place_quantities :integer          default(9999)
#

class Course < ApplicationRecord
  COURSE_STATUS = %w[new in_process completed].freeze

  geocoded_by :address
  has_many_attached :pictures
  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :lessons, dependent: :destroy

  after_validation :geocode
  validates :status, inclusion: COURSE_STATUS
  validates_presence_of :name, :description, :place_quantities
  validates :pre_moderation, inclusion: { in: [true, false] }
  validates :place_quantities, numericality: { greater_than: 0 }
end

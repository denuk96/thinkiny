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
#  attendance_rate  :integer          default(50)
#

class Course < ApplicationRecord
  COURSE_STATUS = %w[new in_process completed].freeze
  COURSE_TYPES = %w[course webinar lecture training masterclass]

  geocoded_by :address
  after_validation :geocode

  has_many_attached :pictures
  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :lessons, dependent: :destroy
  has_many :course_categories
  has_many :categories, through: :course_categories

  validates :status, inclusion: COURSE_STATUS
  validates_presence_of :name, :description, :place_quantities, :attendance_rate, :category_ids
  validates :pre_moderation, inclusion: { in: [true, false] }
  validates :place_quantities, numericality: { greater_than: 0 }
  validates :attendance_rate, inclusion: { in: 0..100, message: 'must be 1 to 100' }
end

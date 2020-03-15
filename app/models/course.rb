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
#  category_id      :bigint
#

class Course < ApplicationRecord
  COURSE_STATUS = %w[new in_process completed].freeze

  geocoded_by :address
  after_validation :geocode

  mount_uploader :logo, PictureUploader
  mount_uploaders :pictures, PictureUploader

  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :lessons, dependent: :destroy
  has_many :course_categories
  has_many :categories, through: :course_categories

  validates :status, inclusion: COURSE_STATUS
  validates_presence_of :name, :description, :place_quantities, :attendance_rate
  validates :pre_moderation, inclusion: { in: [true, false] }
  validates :place_quantities, numericality: { greater_than: 0 }
  validates :attendance_rate, inclusion: { in: 0..100, message: 'must be of 1 to 100' }
  validates :logo, :pictures, file_size: { less_than: 5.megabytes }

  scope :newest, -> { order('created_at ASC') }
  scope :popular, -> { left_outer_joins(:users).group('courses.id').order('COUNT(users.id) DESC') }
  scope :unpopular, -> { left_outer_joins(:users).group('courses.id').order('COUNT(users.id) ASC') }
  scope :fresh, -> { where(status: 'new') }
  scope :in_process, -> { where(status: 'in_process') }
  scope :completed, -> { where(status: 'completed') }
  scope :rated, lambda {
                  joins(:course_users)
                    .where(course_users: { role: 'organizer' })
                    .joins(:users)
                    .order(rating: :desc)
                }
end

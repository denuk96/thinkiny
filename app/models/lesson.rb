# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  theme       :string
#  description :text
#  time        :datetime
#  course_id   :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :course
  has_many :check_ins, dependent: :destroy
  has_many :users, through: :check_ins

  validates_presence_of :theme, :description, :time
end

# == Schema Information
#
# Table name: check_ins
#
#  id         :bigint           not null, primary key
#  lesson_id  :bigint
#  user_id    :bigint
#  attendance :boolean          default(FALSE)
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CheckIn < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :attendance, inclusion: { in: [true, false] }
end

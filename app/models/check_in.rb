# == Schema Information
#
# Table name: check_ins
#
#  id         :bigint           not null, primary key
#  lesson_id  :bigint           not null
#  user_id    :bigint           not null
#  present    :boolean          default(FALSE)
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CheckIn < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
end

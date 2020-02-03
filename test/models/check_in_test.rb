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

require 'test_helper'

class CheckInTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

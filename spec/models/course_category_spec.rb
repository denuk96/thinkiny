# == Schema Information
#
# Table name: course_categories
#
#  id          :bigint           not null, primary key
#  course_id   :bigint
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe CourseCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

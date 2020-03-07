# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

class Category < ApplicationRecord
  has_many :course_categories
  has_many :courses, through: :course_categories
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

FactoryGirl.define do
  factory :category do
  end
end

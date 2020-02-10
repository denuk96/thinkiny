FactoryGirl.define do
  factory :course do
    name 'test name'
    # sequence do it uniq
    description 'test description'
  end
end
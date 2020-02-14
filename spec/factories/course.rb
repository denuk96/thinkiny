FactoryGirl.define do
  factory :course do
    sequence(:name) { |i| "test name#{i}" }
    description 'test description'
  end
end

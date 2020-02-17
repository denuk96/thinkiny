FactoryGirl.define do
  factory :course do
    sequence(:name) { |i| "test name#{i}" }
    description 'test description'
    place_quantities '400'
  end
end

FactoryGirl.define do
  factory :lesson do
    theme 'test theme'
    description 'test description'
    time '2020-02-06 23:17:23'
    association(:course)
  end
end

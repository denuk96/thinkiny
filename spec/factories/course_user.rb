FactoryGirl.define do
  factory :course_user do
    association(:course)
    association(:user)
    role 'organizer'
  end
end

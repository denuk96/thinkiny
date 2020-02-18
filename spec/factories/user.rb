FactoryGirl.define do
  factory :user do
    factory :user_no_admin do
      sequence(:email) { |i| "email#{i}@com" }
      password 'password'
      password_confirmation 'password'
    end
    factory :user_admin do
      sequence(:email) { |i| "#{i}email#{i}@com" }
      password 'password'
      password_confirmation 'password'
      admin 'true'
    end
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "emaadasil#{i}@mail#{i + 3}.com" }
    password 'password'
    password_confirmation 'password'
  end
end
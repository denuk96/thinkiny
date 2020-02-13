FactoryGirl.define do
  factory :user do
    factory :user_no_admin do
      sequence(:email) { |i| "emaada#{i}sil#{i}@mail#{i + 3}.com" }
      password 'password'
      password_confirmation 'password'
    end
    factory :user_admin do
      sequence(:email) { |i| "ema#{i}adasil#{i}@mail#{i + 3}.com" }
      password 'password'
      password_confirmation 'password'
      admin 'true'
    end
  end
end

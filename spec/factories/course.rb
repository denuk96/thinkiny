FactoryGirl.define do
  factory :course do
    name 'test name'
    # sequence do it uniq
    sequence(:description) { |i| "#{i} desc" }
  end
end
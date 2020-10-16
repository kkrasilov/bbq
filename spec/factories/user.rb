FactoryBot.define do
  factory :user do
    name { "Пользователь_#{rand(999)}" }
    sequence(:email) { |n| "example#{n}@example.com" }
    after(:build) { |u| u.password_confirmation = u.password = "123456" }
  end
end

FactoryBot.define do
  factory :event do
    title { "BBQ_#{rand(999)}" }
  end
end

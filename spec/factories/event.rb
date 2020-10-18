FactoryBot.define do
  factory :event do
    title { "BBQ_#{rand(999)}" }
    address { 'Nijnii Tagil' }
    datetime { 1.days.after }
  end
end

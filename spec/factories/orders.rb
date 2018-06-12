FactoryBot.define do
  factory :order_ordered, class: Order do
    sequence :total { 100 }
    sequence :status { "Ordered" }
    sequence :user { |n| association(:app_user) }
  end
end

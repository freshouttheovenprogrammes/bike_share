FactoryBot.define do
  factory :order_ordered, class: Order do
    sequence :total { 100 }
    sequence :status { "Ordered" }
    sequence :user_id { |n| n }
  end
end

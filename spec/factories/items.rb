FactoryBot.define do
  factory :item, class: Item do
    sequence :title { |n| "title#{n}" }
    sequence :description { |n| "description#{n}" }
    sequence :price { |n| n * 2 }
    sequence :image { |n| "image#{n}.jpg" }
    sequence :status { "active" }
    sequence :quantity { |n| n }
    sequence category_id: 0
  end

  factory :bike, class: Item do
    sequence :title { |n| "title#{n}" }
    sequence :description { |n| "description#{n}" }
    sequence :price { |n| n * 2 }
    sequence :image { |n| "image#{n}.jpg" }
    sequence status: "active"
    sequence :quantity { |n| n }
    sequence category_id: 1
  end
end

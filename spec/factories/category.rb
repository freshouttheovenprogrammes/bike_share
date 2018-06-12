FactoryBot.define do
  factory :category, class: Category do
    sequence :title { "Bike" }
    sequence :id { 1 }
    sequence :created_at { Time.now }
    sequence :updated_at { Time.now }
  end
end

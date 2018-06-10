FactoryBot.define do
  factory :category, class: Category do
    sequence :title do
      "Bike"
    end
    sequence :id do
      1
    end
    sequence :created_at do
      Time.now
    end
    sequence :updated_at do
      Time.now
    end
  end
end

# trait :unpublished do
#    status :unpublished
#  end

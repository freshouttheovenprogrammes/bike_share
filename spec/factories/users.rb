

FactoryBot.define do
  factory :app_user, class: User do
    sequence :username { |n| "username#{n}" }
    sequence :first_name { |n| "first_name#{n}" }
    sequence :last_name { |n| "last_name#{n}" }
    sequence :email { |n| "email#{n}@gmail.com" }
    sequence :image { |n| "stock-person.jpeg" }
    before(:create) do |user|
      user.create_app_credential(password: "test123")
      end
    end


  factory :google_user, class: User do
    sequence :first_name { |n| "first_name#{n}" }
    sequence :last_name { |n| "last_name#{n}" }
    sequence :email { |n| "email#{n}@gmail.com" }
    before(:create) do |user|
      user.create_google_credential(provider: "google",
                                    uid: "1234567789",
                                    token: "abcdeghj",
                                    oauth_expires_at: DateTime.now
      )
    end
  end

  factory :admin_app_cred, class: User do
    sequence :first_name { |n| "first_name#{n}" }
    sequence :last_name { |n| "last_name#{n}" }
    sequence :email { |n| "email#{n}@gmail.com" }
    sequence role: 0
    before(:create) do |user|
      user.create_app_credential(password: "test123")
    end
  end
end

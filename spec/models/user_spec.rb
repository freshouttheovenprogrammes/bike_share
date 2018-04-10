require 'rails_helper'

describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      provider: "google",
      uid: "12355565",
      info: {
        email: "test@google.com",
        first_name: "zac",
        last_name: "palmquist",
        image: "www.image.com/image.jpg",
      },
      credentials: {
        token: "hagshagshsag",
        expires_at: DateTime.now
      }
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq(auth[:provider])
    expect(new_user.uid).to eq(auth[:uid])
    expect(new_user.email).to eq(auth[:info][:email])
    expect(new_user.first_name).to eq(auth[:info][:first_name])
    expect(new_user.last_name).to eq(auth[:info][:last_name])
    expect(new_user.image).to eq(auth[:info][:image])
    expect(new_user.oauth_token).to eq(auth[:credentials][:token])
  end
  it "regular user can be created" do
    user = User.create!(username: "Testname", first_name: "Bob", last_name: "Still bob", password: "badpassword", email: "email@email.com")

    expect(user).to be_valid
  end
  it "uniqueness of username regardless of case_use" do
    User.create(username: "TEsTnAmE", first_name: "Bob", last_name: "Still bob", password: "badpassword", email: "email@email.com")
    user2 = User.create(username: "testname", first_name: "2222Bob", last_name: "2222Still bob", password: "badpassword", email: "23232email@email.com")

    expect(user2).to_not be_valid
  end
end

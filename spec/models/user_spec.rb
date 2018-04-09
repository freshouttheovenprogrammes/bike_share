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
        refresh_token: "blajw224",
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
    expect(new_user.refresh_token).to eq(auth[:credentials][:refresh_token])
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
  end
end

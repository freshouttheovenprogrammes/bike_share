require 'rails_helper'

describe User, type: :model do
  context "oauth"
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
      expect(new_user.google_credential.provider).to eq(auth[:provider])
      expect(new_user.google_credential.uid).to eq(auth[:uid])
      expect(new_user.email).to eq(auth[:info][:email])
      expect(new_user.first_name).to eq(auth[:info][:first_name])
      expect(new_user.last_name).to eq(auth[:info][:last_name])
      expect(new_user.image).to eq(auth[:info][:image])
      expect(new_user.google_credential.oauth_token).to eq(auth[:credentials][:token])
    end
  context "relationships"
    it {should have_one(:app_credential)}
    it {should have_one(:google_credential)}
    it {should have_many(:orders)}
    it {should validate_presence_of :email}
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
end

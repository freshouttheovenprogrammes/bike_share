require 'rails_helper'

describe "As a user" do
  let(:app_user) { create(:user) }

  it "I can log back in after having an account" do
    visit "/"

    click_link("Log In")
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.app_credential.password
    click_link("Submit")

    expect(current_path).to eq users_path(user)
  end
end

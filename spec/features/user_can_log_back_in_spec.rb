require 'rails_helper'

describe "As a user" do
  let(:app_user) { FactoryBot.create(:app_user) }

  it "I can log back in after having an account" do
    visit "/"

    click_link("Log In")
    expect(current_path).to eq signin_path

    fill_in "username", with: app_user.username
    fill_in "password", with: app_user.app_credential.password
    click_on("Submit")

    expect(current_path).to eq users_path(app_user)
  end
end

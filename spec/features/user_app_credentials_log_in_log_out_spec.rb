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
    expect(page).to have_content "Welcome to your profile, #{app_user.first_name}!"
  end

  it "I can log out after signing in" do
    visit "/"

    click_link("Log In")

    expect(current_path).to eq signin_path

    fill_in "username", with: app_user.username
    fill_in "password", with: app_user.app_credential.password
    click_on("Submit")

    click_link("Sign Out")

    expect(current_path). to eq root_path
  end
end

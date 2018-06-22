require 'rails_helper'

describe "As a registered user on their profile page" do
  let(:app_user) { FactoryBot.create(:app_user) }
  let(:app_user_2) { FactoryBot.create(:app_user) }
  before(:each) do
    visit root_path

    click_link "Log In"

    fill_in "username", with: app_user.username
    fill_in "password", with: app_user.app_credential.password

    click_on "Submit"
  end
  context "I can update my own information" do
    it "from my profile page" do

      click_link "Edit Account Details"

      expect(current_path).to eq edit_user_path(app_user)
      
      fill_in "user[first_name]", with: "changed"
      fill_in "user[last_name]", with: "new name"
      fill_in "user[email]", with: "new.email@gmail.com"
      fill_in "user[username]", with: "pineapple-pen"
      fill_in "user[password]", with: "crazyasspassword"

      click_on "Update Profile"

      expect(current_path).to eq dashboard_path(app_user)
      expect(page).to have_content "changed"
      expect(page).to have_content "new name"
      expect(page).to have_content "new.email@gmail.com"
      expect(page).to have_content "pineapple-pen"
    end
    it "but not on another users account" do
      visit edit_user_path(app_user_2)

      expect(status_code).to eq 404
    end
  end
end

require 'rails_helper'

describe "As a registered user on their profile page" do
  let(:app_user) { FactoryBot.create(:app_user) }
  before(:each) do
    visit root_path

    click_link "Log In"

    fill_in "username", with: app_user.username
    fill_in "password", with: app_user.app_credential.password

    click_on "Submit"
  end
  context "I can update my own information" do
    it "from my profile page" do
      click_link "Edit Account Details" # later change to click on
      expect(current_path).to eq edit_user_path(app_user)
    end
  end
end

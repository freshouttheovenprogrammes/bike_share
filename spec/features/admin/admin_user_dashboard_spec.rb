require 'rails_helper'

describe "As a logged in admin" do
  context "when I visit '/admin/dashboard'" do
    let(:admin) { FactoryBot.create(:admin_app) }
    before(:each) do
      visit signin_path

      fill_in "username", with: admin.username
      fill_in "password", with: admin.app_credential.password

      click_on "Submit"
    end
    it "I will see a heading on the page that says Admin Dashboard" do
      expect(current_path).to eq admin_dashboard_path
    end
  end
end

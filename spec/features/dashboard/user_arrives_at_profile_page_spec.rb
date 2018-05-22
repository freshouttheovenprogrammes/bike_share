require 'rails_helper'

describe "As a registered user" do

  let(:app_user) { FactoryBot.create(:app_user) }

  context "when I visit the root" do
    context "I should see a link for login" do
      context "and when I click Login" do
        it "I should be on the login page" do

          visit root_path

          click_link "Log In"

          expect(current_path).to eq signin_path
        end

        it "and I should see credentials to log in" do

          visit root_path

          click_link "Log In"

          fill_in "username", with: app_user.username
          fill_in "password", with: app_user.app_credential.password

          click_on "Submit"

          expect(current_path).to eq dashboard_path
          expect(page).to have_content "#{app_user.username}"

          click_link "Home"

          expect(page).to have_content "My Profile"
        end

        it "navbar test" do
          visit root_path

          click_link "Log In"

          fill_in "username", with: app_user.username
          fill_in "password", with: app_user.app_credential.password

          click_on "Submit"

          expect(page).to_not have_link "Log In"
          expect(page).to_not have_link "Sign in with Google"
          expect(page).to have_link "Home"
          expect(page).to have_link "Sign Out"
          expect(page).to have_link "Visit Store"
        end

        it "cannot access admin dashboard" do
          visit root_path

          click_link "Log In"

          fill_in "username", with: app_user.username
          fill_in "password", with: app_user.app_credential.password

          click_on "Submit"

          visit admin_dashboard_path
          expect(page).to have_http_status(404)
        end
      end
    end
  end
end

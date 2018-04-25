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

        xit "and I should see credentials to log in" do

          visit root_path

          click_link "Log In"

          fill_in "username", with: app_user.username
          fill_in "password", with: app_user.app_credential.password

          click_on "Submit"

          expect(current_path).to eq "/dashboard"

          within('#nav-container') do
            expect(page).to have_content "Logged In As #{app_user.username}"
          end
        end
      end
    end
  end
end
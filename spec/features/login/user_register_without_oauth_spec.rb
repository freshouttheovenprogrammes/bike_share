require 'rails_helper'

describe "as a user" do
  describe "when I visit the home page" do
    context "I can sign up for the site without Oauth" do
      it "and see my profile page" do
        visit "/"

        expect(page).to have_content("Sign Up For An Account!")
        click_link("Sign Up For An Account!")

        expect(current_path).to eq "/users/new"

        fill_in "user[username]", with: "Testyguy"
        fill_in "user[first_name]", with: "Test"
        fill_in "user[last_name]", with: "Guy"
        fill_in "user[email]", with: "test@gmail.com"
        fill_in "user[password]", with: "test123"
        click_on("Register")

        new_user = User.last
        expect(current_path).to eq dashboard_path
      end
    end
  end
end

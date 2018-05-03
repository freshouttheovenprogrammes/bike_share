require 'rails_helper'

describe "As an authenticated user" do

  let(:app_user) { FactoryBot.create(:app_user) }

  context "when I visit /orders" do

    before(:each) do
      visit signin_path

      fill_in "username", with: app_user.username
      fill_in "password", with: app_user.app_credential.password

      click_on "Submit"

      expect(current_path).to eq dashboard_path(app_user)

      Order.create!(total: 666, status: "ordered", user: app_user)
    end

   it "I should see all orders belonging to me" do

     visit order_path(app_user)


    end
  end
end

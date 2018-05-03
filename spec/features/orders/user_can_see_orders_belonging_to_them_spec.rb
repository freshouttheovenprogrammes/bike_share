require 'rails_helper'

describe "As an authenticated user" do

  let(:app_user) { FactoryBot.create(:app_user) }
  let (:user2) { FactoryBot.create(:app_user) }
  let(:order) { FactoryBot.create(:order_ordered) }
  context "when I visit /orders" do

    before(:each) do
      visit signin_path

      fill_in "username", with: app_user.username
      fill_in "password", with: app_user.app_credential.password

      click_on "Submit"

      expect(current_path).to eq dashboard_path(app_user)
    end

   it "I should see all orders belonging to me" do
     order.assign_order(app_user)
     order2 = Order.create!(total: 22, status: 1, user: user2)

     visit user_orders_path(app_user)
     expect(page).to_not have_content order2.status
     expect(page).to_not have_content order2.total

     expect(page).to have_content order.status
     expect(page).to have_content order.total
     expect(page).to have_link "View Order"
    end
  end
end

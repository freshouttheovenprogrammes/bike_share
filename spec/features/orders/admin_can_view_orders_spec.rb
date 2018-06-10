require 'rails_helper'

describe "As a regular user" do
  context "when I go to the orders page" do
    let(:app_user)  { FactoryBot.create(:app_user) }
    before(:each) do
      visit signin_path
      fill_in "username", with: app_user.username
      fill_in "password", with: app_user.app_credential.password

      click_on "Submit"
    end
    it "I cannot see all orders" do
      FactoryBot.create(:order_ordered)
      visit admin_orders_path(app_user)

      expect(status_code).to eq 404
    end
  end
end

describe "As an admin" do
  context "when I go to look at an order" do
    let(:admin) { FactoryBot.create(:admin_app) }
    let(:order) { FactoryBot.create(:order_ordered)}
    category = Category.create!(title: "bikes")

    before(:each) do
      order.assign_order(admin)

      visit signin_path

      fill_in "username", with: admin.username
      fill_in "password", with: admin.app_credential.password

      click_on "Submit"

      item = Item.create!(title: "Test", description: "Merles a dog", price: 500, image: 'cruiser.png', status: "active", quantity: 2, category: category)
      visit bikes_path

      click_on "Add Item To Cart"

      visit cart_index_path(user)

      click_on "Checkout"
    end
    it "I can see order details" do
      order = FactoryBot.create(:order_ordered)
      visit admin_order_path(order)

      expect(page).to have_link    item.title
      expect(page).to have_content item.quantity
      expect(page).to have_content item.price
      expect(page).to have_content order.total
      expect(page).to have_content order.status
    end
  end
end

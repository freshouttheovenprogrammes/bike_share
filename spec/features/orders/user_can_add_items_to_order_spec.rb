require 'rails_helper'

describe "As a registered user" do
  context "while at the bikes index page" do
    let(:bike) { FactoryBot.create(:bike) }
    let(:app_user) { FactoryBot.create(:app_user) }

    before(:each) do
      visit signin_path

      fill_in "username", with: app_user.username
      fill_in "password", with: app_user.app_credential.password

      click_on "Submit"
    end

    it "I can add items to my order" do
      Category.create!(title: "bikes")
      Item.create!(title: "Test", description: "Merles a dog", price: 500, image: 'cruiser.png', status: "active", quantity: 2, category_id: 1)
      user = User.last

      visit bikes_path
      within('#bike_1') do
        click_on "Add Item To Cart"
      end

      visit cart_index_path(user)

      click_on "Checkout"

      expect(current_path).to eq user_orders_path

      expect(page).to have_content "500"
      expect(page).to have_content "Ordered"
    end
  end
end

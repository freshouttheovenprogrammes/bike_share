require 'rails_helper'

describe "As a registered user" do
  context "while at the bikes index page" do
    let(:app_user) { FactoryBot.create!(:app_user) }
    let(:bike) { FactoryBot.create!(:bike) }
    it "I can add items to my order" do
      Category.create!(title: "bikes")
      Item.create!(title: "Test", description: "Merles a dog", price: 500, image: 'cruiser.png', status: "active", quantity: 2, category_id: 1)
      user = User.last
      visit bikes_path
      save_and_open_page
      within('#bike') do
        click_on "Add To Cart"
      end

      visit cart_index_path(user)

      click_on "Check Out"

      expect(Cart.contents).to eq 1
      expect(Cart.last.status).to eq "Completed"
    end
  end
end

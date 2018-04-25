require 'rails_helper'

describe "As a visitor" do
  context "when I visit any page with an item on it" do
    context "I should see a button for 'Add to Cart' " do
      it "on the bikes path" do

      visit bikes_path

      expect(page).to have_content "Cart: 0"
      expect(page).to have_content "Add Item To Cart"
      end
    end
  end
  context "if there is no item on the page" do
    context "I don't need to see the cart information" do
      xit "on the new_user path" do

      end
      xit "on the home page" do

      end
    end
  end
end

require 'rails_helper'

describe "As a visitor" do
  context "when I visit any page" do
    context "I should see a button for 'Add to Cart' in the nav " do
      it "on the bikes path" do

      visit bikes_path

      within("#nav-container") do
        expect(page).to have_content "Cart: 0"
      end
      
      expect(page).to have_content "Add Item To Cart"
      end
    end
  end
end

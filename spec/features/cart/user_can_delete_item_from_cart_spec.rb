require 'rails_helper'

describe "user navigates to shop index" do
  context "visit[items_path]" do
    it "they can delete item after added to cart" do
      item1 = Item.create(title: "poop", description: "need i say more",
      price: 666, image: "fixed_gear.png", quantity: 20 )
      visit items_path

      click_button('Add Item')

      visit cart_index_path
      click_on('Delete Item From Cart')

      expect(current_path).to eq items_path
      expect(page).to have_content("You now have 0 #{item1.title}s in cart.")
    end

    xit "after item is deleted the quantity reduces by 1" do

    end
  end
end

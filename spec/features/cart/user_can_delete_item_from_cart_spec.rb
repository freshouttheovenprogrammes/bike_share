require 'rails_helper'

describe "user navigates to shop index" do
  context "visit[items_path]" do
    it "they can delete item after added to cart" do
      item1 = Item.create(title: "poop", description: "need i say more",
      price: 666, image: "fixed_gear.png", quantity: 20 )
      visit items_path

      click_button('Add Item')

      visit carts_path
      save_and_open_page
      click_on('Delete Item From Cart')
      expect(current_path).to eq carts_path

      expect(page).to_not have_content(item1.title)
      expect(page).to_not have_content(item1.description)
      expect(page).to_not have_content(item1.price)
    end

    xit "after item is deleted the quantity reduces by 1" do

    end
  end
end

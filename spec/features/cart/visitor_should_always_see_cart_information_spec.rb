require 'rails_helper'

describe "As a visitor" do
  context "when I visit any page" do
    context "I should see a button for 'Add to Cart' in the nav" do
      it "on the bikes path" do
      Category.create!(title: "bikes")
      Item.create!(title: "bike", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                  quantity: 2, category_id: 1)
      visit bikes_path

      within("#nav-container") do
        expect(page).to have_content "Cart: 0"
      end

      expect(page).to have_button "Add Item To Cart"
      end
      it "on the accessories path" do
        category = Category.create!(id: 2, title: "accessories")
        Item.create!(title: "accessory", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                    quantity: 2, category: category)

        visit accessories_path

        within("#nav-container") do
          expect(page).to have_content "Cart: 0"
        end

        expect(page).to have_button "Add Item To Cart"
      end
      it "on the tools path" do
        category = Category.create!(id: 3, title: "tools")
        Item.create!(title: "accessory", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                    quantity: 2, category: category)

        visit tools_path

        within("#nav-container") do
          expect(page).to have_content "Cart: 0"
        end

        expect(page).to have_button "Add Item To Cart"
      end
      it "on the lessons path" do
        category = Category.create!(id: 4, title: "lessons")
        Item.create!(title: "accessory", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                    quantity: 2, category: category)

        visit lessons_path

        within("#nav-container") do
          expect(page).to have_content "Cart: 0"
        end

        expect(page).to have_button "Add Item To Cart"
      end
      it "on the dashboard" do

        visit root_path
        within("#nav-container") do
          expect(page).to have_content "Cart: 0"
        end
      end
      context "and add an item to the cart" do
        it "the cart amount increases" do
          category = Category.create!(id: 4, title: "lessons")
          Item.create!(title: "accessory", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                      quantity: 2, category: category)

          visit lessons_path

          click_button "Add Item To Cart"

          within("#nav-container") do
            expect(page).to have_content "Cart: 1"
          end
        end
        it "the cart total amount increases" do
          category = Category.create!(id: 4, title: "lessons")
          Item.create!(title: "accessory", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                      quantity: 2, category: category)

          visit lessons_path

          click_button "Add Item To Cart"

          visit cart_index_path

          expect(page).to have_content("$300.00")
        end
      end
      context "and delete an item from the cart" do
        it "the cart amount decreases" do
          category = Category.create!(id: 4, title: "lessons")
          Item.create!(title: "accessory", description: "hey", price: 300, image: 'mountain_bike.png', status: "active",
                      quantity: 2, category: category)

          visit lessons_path

          click_button "Add Item To Cart"

          visit cart_index_path

          click_button "Delete Item From Cart"

          within("#nav-container") do
            expect(page).to have_content "Cart: 0"
          end
        end
      end
    end
  end
end

require 'rails_helper'

  describe "user navigates to shop index"  do
    context "visit[items_path]"  do
      it "they click add to cart and item is added"  do
        item1 = Item.create(title: "poop", description: "need i say more",
        price: 666, image: "fixed_gear.png", quantity: 20 )

        item2 = Item.create(title: "poopy", description: "i say more",
        price: 420, image: "fixed_gear.png", quantity: 20 )

        visit "/"

        expect(page).to have_content("Sign Up For An Account!")
        click_link("Sign Up For An Account!")

        expect(current_path).to eq "/users/new"

        fill_in "user[username]", with: "Testyguy"
        fill_in "user[first_name]", with: "Test"
        fill_in "user[last_name]", with: "Guy"
        fill_in "user[email]", with: "test@gmail.com"
        fill_in "user[password]", with: "test123"
        click_on("Register")

        visit items_path

        within "#item_1" do
          click_button('Add Item To Cart')
        end

        within "#item_2" do
          click_button('Add Item To Cart')
        end

        visit cart_index_path
        save_and_open_page
        expect(page).to have_content(item1.title)
        expect(page).to have_content(item1.description)
        expect(page).to have_content(item1.price)
        expect(page).to have_content("Sum Of All Items: 1086")
      end
    end
  end

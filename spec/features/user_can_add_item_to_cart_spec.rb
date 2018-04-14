require 'rails_helper'

  describe "user navigates to shop index"  do
    context "visit[items_path]"  do
      it "they click add to cart and item is added"  do
        item1 = Item.create(title: "poop", description: "need i say more",
        price: 666, image: "fixed_gear.png", quantity: 20 )

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

        click_button('Add Item')

        visit cart_path

        expect(page).to have_content(item1.title)
        expect(page).to have_content(item1.description)
        expect(page).to have_content(item1.price)
      end
    end
  end

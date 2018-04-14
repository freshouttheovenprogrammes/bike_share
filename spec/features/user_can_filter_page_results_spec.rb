require 'rails_helper'

  describe 'user navigates to bikes section'  do
    context 'user navigates to [bikes_path]'  do
      it 'they only see bikes on the page'  do
        cat = Category.create(title: "bikes")
        cat = Category.create(title: "parts")
        item1 = Item.create(title: "bike", description: "need i say more",
        price: 666, image: "fixed_gear.png", quantity: 20, categories_id: 1 )
        item2 = Item.create(title: "not bike", description: "more not bikes",
        price: 123, image: "fixed_gear.png", quantity: 2, categories_id: 2 )
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

        visit bikes_path

        expect(page).to have_content(item1.title)
        expect(page).to have_content(item1.description)
        expect(page).to have_content(item1.price)
        expect(page).to_not have_content(item2.title)
        expect(page).to_not have_content(item2.description)
        expect(page).to_not have_content(item2.price)
      end
    end
  end

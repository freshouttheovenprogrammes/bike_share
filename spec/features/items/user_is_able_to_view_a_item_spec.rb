    require 'rails_helper'

        describe "as a user" do
          describe "when I visit the home page" do
            context "I can sign up for the site without Oauth" do
              it "and see my profile page" do
                item = Item.create(title: "poop", description: "need i say more",
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

              visit item_path(item)

              expect(page).to have_content("poop")
              expect(page).to have_content("need i say more")
              expect(page).to have_content(666)
              expect(page).to have_content(20)
            end
          end
        end
      end

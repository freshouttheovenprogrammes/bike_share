require 'rails_helper'
require "date"

  describe 'user visits conditions index'  do
    context 'visit conditions_path'  do
      it 'user sees all conditions'  do
        condition1 = Condition.create(date: DateTime.new, max_temp: 666, mean_temp: 420, min_temp: 32, mean_visibility_miles: 34,
                                        mean_humidity: 123, mean_wind_speed: 669, precipitation_inches: 35)

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

        visit condition_path(condition1)

        expect(page).to have_content(condition1.date)
        expect(page).to have_content(condition1.max_temp)
        expect(page).to have_content(condition1.mean_temp)
        expect(page).to have_content(condition1.min_temp)
        expect(page).to have_content(condition1.mean_visibility_miles)
        expect(page).to have_content(condition1.mean_humidity)
        expect(page).to have_content(condition1.mean_wind_speed)
      end
    end
  end 

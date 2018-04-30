require 'rails_helper'
require "date"

  describe 'user visits conditions index'  do
    context 'visit conditions_path'  do
      it 'user sees all conditions'  do
        condition1 = Condition.create(date: DateTime.new, max_temp: 666, mean_temp: 420, min_temp: 32, mean_visibility_miles: 34,
                                        mean_humidity: 123, mean_wind_speed: 669, precipitation_inches: 35)
        condition2 = Condition.create(date: DateTime.new, max_temp: 12345, mean_temp: 890, min_temp: 45, mean_visibility_miles: 32,
                                        mean_humidity: 23, mean_wind_speed: 56, precipitation_inches: 78)



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

        visit conditions_path

        expect(page).to have_content(condition1.date)
        expect(page).to have_content(condition1.max_temp)
        expect(page).to have_content(condition1.mean_temp)
        expect(page).to have_content(condition1.min_temp)
        expect(page).to have_content(condition1.mean_visibility_miles)
        expect(page).to have_content(condition1.mean_humidity)
        expect(page).to have_content(condition1.mean_wind_speed)
        expect(page).to have_content(condition1.precipitation_inches)
        expect(page).to have_content(condition2.date)
        expect(page).to have_content(condition2.max_temp)
        expect(page).to have_content(condition2.mean_temp)
        expect(page).to have_content(condition2.min_temp)
        expect(page).to have_content(condition2.mean_visibility_miles)
        expect(page).to have_content(condition2.mean_humidity)
        expect(page).to have_content(condition2.mean_wind_speed)
        expect(page).to have_content(condition2.precipitation_inches)
      end
    end
  end

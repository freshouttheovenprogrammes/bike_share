require 'rails_helper'

  describe 'user visits stations index'  do
    context 'visit [stations_path]'  do
      it 'user sees stations info'  do
        station = Station.create(name: "station", latitude: 123456,
        longitude: 1234567, dock_count: 666, city: "Denver",
        installation_date: "8/6/2013")

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

        visit stations_path

        expect(page).to have_content(station.name)
        expect(page).to have_content(station.latitude)
        expect(page).to have_content(station.longitude)
        expect(page).to have_content(station.dock_count)
        expect(page).to have_content(station.city)

      end
    end
  end

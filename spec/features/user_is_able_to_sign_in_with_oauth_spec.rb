require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] =
    OmniAuth::AuthHash.new({

      })
    end


  describe 'user can sign in'  do
    context 'from the home page'  do
      it 'with oauth'  do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Google")

      click_link "Sign in with Google"

      expect(page).to have_content("Kyle Sallette")

      expect(page).to have_link("Logout")

      end
    end
  end

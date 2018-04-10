require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google, {
      provider: "google",
      uid: "12345",
      info: {
        email: "test@google.com",
        first_name: "kyle",
        last_name: "sallette",
        image: "something.jpg"
      },
      credentials: {
        token: "123e45",
        refresh_token: "34534232",
        expires_at: DateTime.now
      }
      })
  end

  describe 'user can sign in'  do
    # require "pry"; binding.pry
    # before do
    #   Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
    # end
    context 'from the home page'  do
      xit 'with oauth'  do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Google")

      click_link "Sign in with Google"

      expect(page).to have_content("kyle sallette")

      expect(page).to have_link("Logout")

      end
    end
  end

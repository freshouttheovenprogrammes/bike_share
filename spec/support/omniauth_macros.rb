module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:google] = {
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
      }
  end
end

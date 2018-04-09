class User < ApplicationRecord

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      email: auth[:info][:email],
      image: auth[:info][:image],
      oauth_token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
      oauth_expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    user
  end

end

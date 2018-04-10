class User < ApplicationRecord

  def self.update_or_create(auth)
    where(provider: auth[:provider], uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.first_name = auth[:info][:first_name]
      user.last_name = auth[:info][:last_name]
      user.email = auth[:info][:email]
      user.image = auth[:info][:image]
      user.oauth_token = auth[:credentials][:token]
      user.oauth_expires_at = Time.at(auth[:credentials][:expires_at])
    user.save!
    end
  end


#
# def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
#     user.provider = auth.provider
#     user.uid = auth.uid
#     user.name = auth.info.name
#     user.oauth_token = auth.credentials.token
#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     user.save!
#   end
# end
end

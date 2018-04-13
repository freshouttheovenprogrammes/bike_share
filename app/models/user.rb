class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false }
  validates_presence_of :email, :first_name, :last_name
  include ActiveModel::Validations
  validates_with CredentialValidator
  has_one :app_credential, dependent: :destroy
  has_one :googlecredential, dependant: :destroy

  enum role: %w(default admin)

  def self.update_or_create(auth)
    google_cred = GoogleCredential.find_by(uid: auth[:uid]) || GoogleCredential.new
    google_cred.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      oauth_token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
      oauth_expires_at: auth[:credentials][:expires_at]
      }
    user = google_cred.update_or_create({
      email: auth[:info][:email],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      image_url: auth[:info][:image]
      })
      user.save!
      google_cred.save!
      user
  end
end

class CreateGoogleCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :google_credentials do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.string :oauth_expires_at
      t.references :user, index: true, foreign_key: true
    end
  end
end

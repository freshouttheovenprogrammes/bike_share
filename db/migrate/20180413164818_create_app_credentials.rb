class CreateAppCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :app_credentials do |t|
      t.string :password_digest
      t.references :user, index: true, foreign_key: true
    end
  end
end

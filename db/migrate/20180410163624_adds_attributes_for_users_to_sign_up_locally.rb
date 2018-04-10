class AddsAttributesForUsersToSignUpLocally < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :username, :password_digest
      t.remove :refresh_token
    end
  end
end

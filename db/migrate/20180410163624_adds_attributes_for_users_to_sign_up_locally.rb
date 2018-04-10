class AddsAttributesForUsersToSignUpLocally < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :username, :password_digest
    end
  end
end

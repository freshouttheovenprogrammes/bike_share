class ChangeColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :status, type: :integer
  end
end

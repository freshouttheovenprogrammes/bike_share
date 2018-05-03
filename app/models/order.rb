class Order < ApplicationRecord
  validates_presence_of :total, :status
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user
  enum status: [:ordered, :paid, :cancelled, :completed]

  def user_order(user)
    Order.select('user.id').where(user.order).map
  end

  def self.user_all_orders(user)
    user.orders
  end
end

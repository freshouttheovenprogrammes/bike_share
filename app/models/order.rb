class Order < ApplicationRecord
  validates_presence_of :total, :status
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user
  enum status: [:Ordered, :Paid, :Cancelled, :Completed]

  def assign_order(user)
    user.orders << self
  end
end

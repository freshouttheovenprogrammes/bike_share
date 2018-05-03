class Order < ApplicationRecord
  validates_presence_of :total, :status
  has_many :items, through: :order_items
  belongs_to :user
  enum status: %w(ordered paid cancelled completed)
end

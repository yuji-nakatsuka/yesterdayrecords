class Order < ApplicationRecord
  has_many :order_contents
  belongs_to :delivery_address
  belongs_to :end_user
end

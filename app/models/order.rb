class Order < ApplicationRecord
  has_many :order_contents
  belongs_to :end_user

  def self.enum(order)
		case order.delivery_status

		when 1 then
			order.delivery_status ="商品準備中"
		when 2 then
			order.delivery_status="配送中"
		when 3 then
			order.delivery_status="配送済み"
		end
		return order
  end

end

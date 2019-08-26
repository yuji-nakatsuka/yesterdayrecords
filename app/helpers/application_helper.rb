module ApplicationHelper

	def delivery_status_enum(delivery_status)
		case delivery_status

		when 1 then
			now_status="商品準備中"
		when 2 then
			now_status="配送中"
		when 3 then
			now_status="配送済み"
		end
		return now_status
	end

end

module Admins::SellCdsHelper

	# sellct時のためのid取得 @ admins/sell_cds_controller/main_new
	def GetColumnId(model_name,column_name)
		models = model_name.all
		i = 0
		@modelid = Array.new(models.size)
		models.each do|label|
			@modelid[i] = [model_name.column_name , model_name.id]
			i += 1
		end
		return ColumnId
	end

	def enum(sell_status)
    case sell_status
    when 1 then
       now_status="販売中"
    when 2 then
       now_status="販売中止"
    end
    return now_status
  end
end

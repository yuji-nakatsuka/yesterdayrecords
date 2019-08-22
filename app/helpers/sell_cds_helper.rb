module SellCdsHelper

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

class TopsController < ApplicationController

  def top
    @new = SellCd.order(:created_time)
    @arrivals = @new.where(sell_status: 1).limit(5)
  end

end

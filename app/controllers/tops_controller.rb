class TopsController < ApplicationController

  def top
    # @new = SellCd.order(created_time: "DESC")
    @arrivals = SellCd.where(sell_status: 1).order(created_at: "DESC").limit(5)
  end

end

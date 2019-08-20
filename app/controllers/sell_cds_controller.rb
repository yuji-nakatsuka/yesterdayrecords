class SellCdsController < ApplicationController
  def search
    @sell_cd = SellCd.search(params[:search])
  end

  def show
    @sell_cd = SellCd.find(params.[:id])
    @discs = @sell_cd.Disc.all
  end

end

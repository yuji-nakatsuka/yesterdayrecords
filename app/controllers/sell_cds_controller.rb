class SellCdsController < ApplicationController
  def search
    @sell_cd = SellCD.search(params[:search])
  end

  def show
    @sell_cd = SellCD.find(params.[:id])
  end

end

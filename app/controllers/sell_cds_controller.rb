class SellCdsController < ApplicationController
  def search
    @sell_cd = SellCd.search(params[:search])
  end

  def show
    @sell_cd = SellCd.find(params[:id])
    @discs = @sell_cd.discs.order(number: "ASC")
    @cart = Cart.new
  end

  def genreidsearch
  	@sell_cds = SellCd.where(genre_id: params[:genre_id])
  end
end

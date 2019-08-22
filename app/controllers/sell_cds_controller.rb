class SellCdsController < ApplicationController
<<<<<<< HEAD
=======
  def search
    @sell_cd = SellCd.search(params[:search])
  end

  def show
    @sell_cd = SellCd.find(params[:id])
    @discs = @sell_cd.discs.order(number: "ASC")
    @cart = Cart.new
  end
>>>>>>> 26a229d60c502562d02261f14a4924d70b32d0cf

end

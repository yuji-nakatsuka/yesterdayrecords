class SellCdsController < ApplicationController


  PER = 10

  def search
    @genres = Genre.all
    @sell_cds = SellCd.search(params[:search]).page(params[:page])
    @search_word = params[:search]
  end

  def show
    @genres = Genre.all
    @sell_cd = SellCd.find(params[:id])
    @discs = @sell_cd.discs.order(number: "ASC")
    @cart = Cart.new
  end


  def genreidsearch
  	@sell_cds = SellCd.where(genre_id: params[:genre_id]).page(params[:page])
    @genres = Genre.all
    @search_word = params[:search]
  end

end

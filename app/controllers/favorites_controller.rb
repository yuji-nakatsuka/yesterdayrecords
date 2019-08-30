class FavoritesController < ApplicationController
	before_action :authenticate_end_user!

	def create
		sell_cd = SellCd.find(params[:sell_cd_id])
		favorite = Favorite.new(sell_cd_id: sell_cd.id)
		favorite.end_user_id = current_end_user.id
		favorite.save
            redirect_to  sell_cd_path(sell_cd.id)
	end

	def destroy
            sell_cd = SellCd.find(params[:sell_cd_id])
            favorite = Favorite.find_by(params[:id])
            favorite.destroy
            redirect_to  sell_cd_path(sell_cd.id)
	end

end

class CartsController < ApplicationController
	before_action :authenticate_end_user!

	def index
		@genres = Genre.all
		@carts = Cart.where(end_user_id: current_end_user.id)
		# 消費税表示 変更可能にしたい
		@sales_tax_rate = 0.08
	end

	def destroy
		cart = Cart.find_by(params[:id])
		cart.destroy
		redirect_to end_user_carts_path
	end

	def add
		cart = Cart.new(cart_params)
		cart.end_user_id = current_end_user.id
		if cart.save
			redirect_to end_user_carts_path
		else
			redirect_to sell_cd_path(cart.sell_cd_id)
		end
	end

	private
		def cart_params
			params.require(:cart).permit(:end_user_id,:sell_cd_id,:quantity)
		end

end

class CartsController < ApplicationController
	def index
		@carts = Cart.where(end_user_if: params[current_end_user.id])
	end

	def destroy
		cart = Cart.find_by(params[:id])
		cart.destroy
		redirect_to end_user_carts_path
	end

	def add
		cart = Cart.new(cart_params)
		cart.save
		redirect_to end_user_carts_path
	end

	private
		def cart_params
			params.require(:cart).permit(:end_user_id,:sell_cd_id,:quantity)
		end
	end

end

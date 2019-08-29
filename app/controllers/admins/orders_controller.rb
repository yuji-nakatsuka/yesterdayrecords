class Admins::OrdersController < ApplicationController
	before_action :authenticate_user!
	
	def show
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to admins_end_user_order_path(@order.id)
		else
			redirect_to admins_end_user_order_path(@order.id)
		end
	end

	def index
   		 @orders = Order.all
	end

	private
		def order_params
			params.require(:order).permit(:end_user_id,:total_price,:payment_method,:zip,:delivery_address,:delivery_status)
		end
end

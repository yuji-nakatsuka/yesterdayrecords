class OrdersController < ApplicationController

  def confirm
    @cart = Cart.find(current_end_user)

  end

  def create
    @order = Order.new
    @order.save
    redirect_to finish_path
  end

  def finish
    @cart = Cart.where(current_end_user)
  end

  def index
    @order = Order.find(current_end_user)
  end

  def show
    @order = Order.find(params[:id])
  end


	def update
	end

end

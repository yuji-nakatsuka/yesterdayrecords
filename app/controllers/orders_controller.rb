class OrdersController < ApplicationController

  def confirm
    @order = Order.new
    @carts = Cart.where(end_user_id: current_end_user)
    @delivery_address = DeliveryAddress.new
  end

  def create
    @order = Order.new
    @order.save
    redirect_to finish_path
  end

  def finish
    @cart = Cart.where(end_user_id: current_end_user)
  end

  def index
    @orders = Order.where(end_user_id: current_end_user)

  end

  def show
    @order = Order.find(params[:id])
  end

end

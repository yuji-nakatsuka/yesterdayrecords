class OrdersController < ApplicationController

  def confirm
    @order = Order.new
    @carts = Cart.where(end_user_id: current_end_user)
    @delivery_address = DeliveryAddress.new
    @end_user=EndUser.find(params[:end_user_id])

  end

  def create
    @order = Order.new(confirm_params)
    @delivery_address=DeliveryAddress.find_by(delivery_address: @order.delivery_address)
    @order.zip = @delivery_address.zip
    @order.end_user_id = params[:end_user_id]
    @total_price=0
    @carts = Cart.where(end_user_id: params[:end_user_id])
    @carts.each do |cart|
      @total_price+=cart.sell_cd.value*cart.quantity
    end
    @total_price*=1.08
    @total_price += 500
    @order.total_price = @total_price
    @order.delivery_status = 0
    @order.save

    @carts = Cart.where(end_user_id: params[:end_user_id])
    @carts.each do |cart|
      @order_content = OrderContent.new
      @order_content.sell_cd_id = cart.sell_cd_id
      @order_content.quantity = cart.quantity
      @order_content.order_id = @order.id
      @order_content.save
      sell_cd =SellCd.find(cart.sell_cd_id)
      sell_cd.stock -= cart.quantity
      sell_cd.save
      cart.destroy
    end

    redirect_to end_user_finish_path(params[:end_user_id],@order.id)
  end

  def finish
    @order = Order.all.order(id:"DESC").find_by(end_user_id: current_end_user)
  end

  def index
    @order = Order.find(current_end_user)
    enum(@order)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def confirm_params
      params.require(:order).permit(:delivery_address,:payment_method)
  end
end

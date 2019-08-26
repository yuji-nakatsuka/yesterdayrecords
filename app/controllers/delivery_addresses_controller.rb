class DeliveryAddressesController < ApplicationController

  def create
      @end_user=EndUser.find(params[:end_user_id])
      @delivery_address = DeliveryAddress.new(delivery_address_params)
      @delivery_address.end_user_id = params[:end_user_id]
      @delivery_address.save
      redirect_to end_user_path(@end_user)
    end


  def update
    @delivery_address = DeliveryAddress.find_by(params[:id])
    if @delivery_address.update(delivery_address_params)
    redirect_to end_user_path(current_end_user)
    else
    redirect_to root_path
    end
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to end_user_path(current_end_user)
  end


    private
    def delivery_address_params
      params.require(:delivery_address).permit(:delivery_address, :zip)
    end


end

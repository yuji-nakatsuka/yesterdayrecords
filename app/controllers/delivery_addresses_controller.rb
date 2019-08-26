class DeliveryAddressesController < ApplicationController

  def create
      @end_user=EndUser.find(params[:end_user_id])
      @delivery_address = DeliveryAddress.new(delivery_address_params)
      if @delivery_address.save
      redirect_to root_path
      else
      redirect_to edit_end_user_path(@end_user)
    end
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @delivery_address.update(delivery_address_params)
    redirect_to end_user_path(current_end_user)
    else
    redirect_to root_path
    end
  end


    private
    def delivery_address_params
      params.require(:delivery_address).permit(:delivery_address)
    end


end

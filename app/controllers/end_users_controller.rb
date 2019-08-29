class EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user=EndUser.find(params[:id])
    @delivery_addresses=@end_user.delivery_addresses
    @favs = Favorite.where(end_user_id: params[:id])
    i = 0
    @favsell_cds=Array.new
    @favs.each do |fav|
      @favsell_cds[i] = fav.sell_cd
      i += 1
    end
  end

  def leave
    @end_user=EndUser.find(params[:id])
    @end_user.destroy
    redirect_to root_path
  end

  def edit
    @end_user=EndUser.find(params[:id])
    @delivery_address = DeliveryAddress.new
    if !(@end_user.delivery_addresses).nil?
      @delivery_addresses = @end_user.delivery_addresses
    end

  end

  def update
    @end_user=EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(current_end_user)
  end

  private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :kana_last, :kana_first, :zip, :address, :phone_number, :email)
  end

end

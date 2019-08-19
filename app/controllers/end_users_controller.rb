class EndUsersController < ApplicationController

  def show
    @end_user=EndUser.find(params.[:id])
  end

  def leave
    @end_user=EndUser.find(params.[:id])
    @end_user.destroy
    redirect_to end_user_path
  end

  def edit
    @end_user=EndUser.find(params.[:id])
  end

  def update
    @end_user=EndUser.find(param[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path
  end

end

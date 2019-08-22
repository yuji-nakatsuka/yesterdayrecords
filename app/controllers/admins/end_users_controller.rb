class Admins::EndUsersController < ApplicationController
	def index
		@end_users = EndUser.all
	end

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
	end

	def destroy
		@end_user = EndUser.find_by(params[:id])
		if @end_user.destroy
			flash[:notice]="successfully destroyed"
			redirect_to admins_end_users_path
		else
			flash[:notice]="Don't destroy error"
			redirect_to admins_end_users_path
		end
	end

	def update
		@end_user = EndUser.find_by(params[:id])
		if @end_user.update(end_user_params)
			flash[:notice]="successfully updated"
			redirect_to admins_end_user_path(@end_user)
		else
			flash[:notice]="Don't updated error"
			redirect_to admins_end_user_path(@end_user)
		end
	end

	private
	def end_user_params
		params.require(:user).permit(:email,:password,:first_name,:last_name,:kana_last,:kana_first,:zip,:address,:phone_number)
	end
end
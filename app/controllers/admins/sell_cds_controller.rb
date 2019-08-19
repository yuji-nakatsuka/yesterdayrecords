class Admins::SellCdsController < ApplicationController
	#before_action :authenticate_user!

	PER = 10

	def show
		@sell_cd = SellCd.find(params[:id])
	end

	def index
		@sell_cds = SellCd.all
	end

	def edit

	end

	def destroy
		sell_cd = SellCD.find(params[:id])
		if sell_cd.destroy
  		flash[:notice] = "Sell_cd was successfully destroyed."
  		redirect_to admins_sell_cds_path
  		end
	end

	def new
	end


	def update
	end

	def create
	end
end



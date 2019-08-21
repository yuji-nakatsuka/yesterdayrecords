class Admins::SellCdsController < ApplicationController
	#before_action :authenticate_user!

	PER = 10

	def show
		@sell_cd = SellCd.find(params[:id])
	end

	def index
		@sell_cds = SellCd.all
	end


	def destroy
		sell_cd = SellCD.find(params[:id])
		if sell_cd.destroy
  		flash[:notice] = "Sell_cd was successfully destroyed."
  		redirect_to admins_sell_cds_path
  		end
	end

	def new
		@artist = Artist.new

	end

	def edit
		@sell_cd = SellCd.find(params[:id])
	end

	def update
		@sell_cd = SellCd.find(params[:id])
		@artist = @sell_cd.artist.find(params[:id])
		if @artist.update(artist_params)
			if @sell_cd.update(sell_cd_params)
				flash[:notice] = "You have updated sell_cd successfully"
				redirect_to admins_sell_cd_path(sell_cd.id)
			else
				puts @sell_cd.errors.full_message
				flash[:notice] = "Error"
				render "edit"
			end
		else
			puts @artist.errors.full_mesage
			flash[:nitice] = "Error"
			render "edit"
		end

	end


	def create
		@sell_cd = SellCd.new
		@artist = Artist.new
		if @artist.save
			if @sell_cd.save
				flash[:notice] = "create"
				redirect_to admins_sell_cds_path
			else
				flash[:notice] = "don't create "
				render "new"
			end
		else
			flash[:notice] = "Error"
			render "new"
	end


	end

	private
	def sell_cd_params
		params.require(:sell_cd).permit(:title,:label_id,:artist_id,:genre_id,:value,:stock,:image, discs_attributes: [:id,:disc,:number,:_destroy,

			songs_attributes: [:ic,:song,:number, :_destroy]])
	end
end




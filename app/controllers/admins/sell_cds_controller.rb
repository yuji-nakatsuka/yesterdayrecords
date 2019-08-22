class Admins::SellCdsController < ApplicationController
	#before_action :authenticate_user!

	PER = 10

	def show
		@sell_cd = SellCd.new
		#@sell_cd = SellCd.find(params[:id])
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




	def artist_new
		@artist = Artist.new
	end

	def genre_new
		@genre = Genre.new
	end

	def label_new
		@label = Label.new
	end

	def main_new
	end

	def artist_create
		@artist = Artist.new(artist_params)
		if @artist.save
			flash[:notice] = "You have created Artist successfully"
			redirect_to admins_top_path
		else
			flash[:notice] = "You don't have created Artist unsuccessfully"
			render :artist_new
		end
	end

	def genre_create
		@genre = Genre.new(genre_params)
		if @genre.save
			flash[:notice] = "You have created Genre successfully"
			redirect_to admins_top_path
		else
			flash[:notice] = "You don't have created Genre unsuccessfully"
			render :genre_new
		end
	end

	def label_create
		@label = Label.new(label_params)
		if @label.save
			flash[:notice] = "You have created Label successfully"
			redirect_to admins_top_path
		else
			flash[:notice] = "You don't created Label unsuccessfully"
			render :label_new
		end
	end

	def main_create
	end

	def artist_edit
		@sell_cd = SellCd.find(params[:id])
		@artist - @sell_cd.artist_id
	end

	def genre_edit
		@sell_cd = SellCd.find(params[:id])
		@genre = @sell_cd.genre_id
	end

	def label_edit
		@sell_cd = SellCd.find(params[:id])
		@label = @sell_cd.label_id
	end

	def main_edit
	end



#ここはプルダウン
	def artist_update
		@sell_cd = SellCd.find(params[:id])
		@artist = @sell_cd.artist_id
		if @artist.update(artist_params)
			flash[:notice] = "You have updated successfully"
			redirect_to admins_sell_cd_path(@sell_cd)
		else
			flash[:notice] = "You don't have updated unsuccessfully"
			render :artist_edit
		end
	end
#ここはプルダウン
	def genre_update
		@sell_cd = SellCd.find(params[:id])
		@genre = @sell_cd.genre_id
		if @genre.update(genre_params)
			flash[:notice] = "You have updated successfully"
			redirect_to admins_sell_cd_path(@sell_cd)
		else
			flash[:notice] = "You have updated unsuccessfully"
			render :artist_edit
		end
	end
#ここはプルダウン
	def label_update
		@sell_cd = SellCd.find(params[:id])
		@label = @sell_cd.label_id
		if @label.update(label_params)
			flash[:notice] = "You have updated successfully"
			redirect_to admins_sell_cd_path(@sell_cd)
		else
			flash[:notice] = "You don't have updated unsuccessfully"
			render :genre_edit
		end
	end
#ここ
	def main_update
		@sell_cd = SellCd.find(params[:id])
		if @sell_cd.update(sell_cd_params)
			flash[:notice] = "You have updated successfully"
			redirect_to admins_sell_cd[:id]
		else
			flash[:notice] = "you don't have updated unsuccessfully"
			render :show
		end

	end

	private
	def artist_params
		params.require(:artist).permit(:artist)
	end

	def genre_params
		params.require(:genre).permit(:genre)
	end

	def label_parms
		params.require(:label).permit(:label)
	end

end



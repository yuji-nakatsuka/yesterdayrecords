class Admins::SellCdsController < ApplicationController
	before_action :authenticate_user!

	PER = 10

	def show
		@sell_cd = SellCd.new
		@sell_cd = SellCd.find(params[:id])
		@discs = @sell_cd.discs.order(number: "ASC")
	end

	def artist_show
		@artist = Artist.find(params[:id])
		@sell_cds = SellCd.where(artist_id: @artist)
		@kaminari = @sell_cds.page(params[:page]).per(PER)
	end

	def genre_show
		@genre = Genre.find(params[:id])
		@sell_cds = SellCd.where(genre_id: @genre)
		@kaminari = @sell_cds.page(params[:page]).per(PER)
	end

	def label_show
		@label = Label.find(params[:id])
		@sell_cds = SellCd.where(label_id: @label)
		@kaminari = SellCd.page(params[:page]).per(PER)
	end

	def index
		@sell_cds = SellCd.page(params[:page]).per(PER)
	end

	def search
	end


	def destroy
		sell_cd = SellCd.find(params[:id])
		if sell_cd.destroy
  		flash[:notice] = "Sell_cd was successfully destroyed."
  		redirect_to admins_sell_cds_path
  		end
	end
	def genre_destroy
		genre = Genre.find(params[:id])
		if genre.destroy
			flash[:notice] = "genre was successfully destroyed"
			redirect_to admins_sell_cds_genre_index_path
		end
	end

	def artist_destroy
		artist = Artist.find(params[:id])
		if artist.destroy
			flash[:notice] = "artist was successfully destroyed"
			redirect_to admins_sell_cds_artist_index_path
		end
	end

	def label_destroy
		label = Label.find(params[:id])
		if label.destroy
			flash[:notice] = "label was successfully destroyed"
			redirect_to admins_sell_cds_label_index_path
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
			redirect_to admins_top_path
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


	def artist_edit
		@artist = Artist.find(params[:id])
	end

	def genre_edit
		@genre = Genre.find(params[:id])
	end

	def label_edit
		@label = Label.find(params[:id])
	end

	def main_edit
		@sell_cd = SellCd.find(params[:id])

				# disc,song作成時使用 cocoon
			@discs = @sell_cd.discs.build
			@songs = @discs.songs.build

			@labelid = Label.getlabelid
			@artistid = Artist.getartistid
			@genreid = Genre.getgenreid
	end



	def genre_index
		@genres = Genre.page(params[:page]).per(PER)
	end

	def artist_index
		@artists = Artist.page(params[:page]).per(PER)
	end

	def label_index
		@labels = Label.page(params[:page]).per(PER)
	end

#ここはプルダウン
	def artist_update
		@artist = Artist.find(params[:id])
		if @artist.update(artist_params)
			flash[:notice] = "You have updated successfully"
			redirect_to  admins_sell_cds_artist_index_path
		else
			flash[:notice] = "You don't have updated unsuccessfully"
			render :artist_edit
		end
	end
#ここはプルダウン
	def genre_update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			flash[:notice] = "You have updated successfully"
			redirect_to admins_sell_cds_genre_index_path
		else
			flash[:notice] = "You have updated unsuccessfully"
			render :artist_edit
		end
	end
#ここはプルダウン
	def label_update
		@label = Label.find(params[:id])
		if @label.update(label_params)
			flash[:notice] = "You have updated successfully"
			redirect_to admins_sell_cds_label_index_path
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
			redirect_to admins_sell_cd_path(@sell_cd.id)
		else
			flash[:notice] = "you don't have updated unsuccessfully"
			render :show
		end

	end


	def main_new
		p "ssss"
		puts "aaaaaa"
		@sell_cd = SellCd.new

		# disc,song作成時使用 cocoon
			@discs = @sell_cd.discs.build
			@songs = @discs.songs.build

		# label,artist,genre表示のため
			@labelid = Label.getlabelid
			@artistid = Artist.getartistid
			@genreid = Genre.getgenreid
	end


	def main_create
		sell_cd = SellCd.new(sell_cd_params)
		disc_number = 0

		if sell_cd.save
			redirect_to admins_sell_cd_path(sell_cd.id)
		else
			redirect_to root_path
		end
	end


	private

    def sell_cd_params
      params.require(:sell_cd).permit(:title, :artist_id, :genre_id, :label_id, :value, :image, :sell_status, :stock, discs_attributes: [:id, :disc, :number, :_destroy, songs_attributes: [:id, :song, :number, :_destroy]])
    end

	def artist_params
		params.require(:artist).permit(:artist)
	end

	def genre_params
		params.require(:genre).permit(:genre)
	end

	def label_params
		params.require(:label).permit(:label)
	end

end



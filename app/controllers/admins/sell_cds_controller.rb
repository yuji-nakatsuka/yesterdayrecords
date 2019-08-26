class Admins::SellCdsController < ApplicationController
	#before_action :authenticate_user!

	PER = 10

	def show
		@sell_cd = SellCd.find(params[:id])
	end

	def index
		@sell_cds = SellCd.all
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

	def artist_new
	end

	def genre_new
	end

	def label_new
	end

	def main_new
		@sell_cd = SellCd.new

		# disc,song作成時使用 cocoon
			@discs = @sell_cd.discs.build
			@songs = @discs.songs.build

		# label,artist,genre表示のため
			@labelid = Label.getlabelid
			@artistid = Artist.getartistid
			@genreid = Genre.getgenreid
	end

	def artist_create
	end

	def genre_create
	end

	def label_create
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

	def edit
	end

	def artist_update
	end

	def genre_update
	end

	def label_update
	end

	def main_update
	end

	private

    def sell_cd_params
      params.require(:sell_cd).permit(:title, :artist_id, :genre_id, :label_id, :value, :image_id, :sell_status, :stock, discs_attributes: [:id, :disc, :number, :_destroy, songs_attributes: [:id, :song, :number, :_destroy]])
    end

end



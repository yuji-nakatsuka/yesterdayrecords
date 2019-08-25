class Genre < ApplicationRecord
  has_many :sell_cds


  	# label,genre,artistまとめたいな @admins/sell_cds
    def self.getgenreid
		genres = self.all
		i = 0
		genreid = Array.new(genres.size)
		genres.each do|genre|
			genreid[i] = [genre.genre , genre.id]
			i += 1
		end
		return genreid
	end
end

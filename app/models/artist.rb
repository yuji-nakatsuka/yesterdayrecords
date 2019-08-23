class Artist < ApplicationRecord
  has_many :sell_cds


  	# label,genre,artistまとめたいな @admins/sell_cds
    def self.getartistid
		artists = self.all
		i = 0
		artistid = Array.new(artists.size)
		artists.each do|artist|
			artistid[i] = [artist.artist , artist.id]
			i += 1
		end
		return artistid
	end
end

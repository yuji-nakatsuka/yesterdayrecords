class SellCd < ApplicationRecord
	attachment :image
	has_many :cd_artists
	has_many :carts
	has_many :discs
	has_many :order_contents
	belongs_to :label
<<<<<<< HEAD
	bolongs_to :genre
=======
	belongs_to :genre
>>>>>>> 7e48367bea9975bbc95458759c7b110fd72e8373
	accepts_nested_attributes_for :discs, allow_destroy: true


	def self.search(search)
        return self.all unless search
        self.where(['content LIKE ?', "%#{search}%"])
    end
end

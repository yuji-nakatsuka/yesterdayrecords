class SellCd < ApplicationRecord
	attachment :image
	has_many :carts
	has_many :discs
	has_many :order_contents
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	has_many :favorites, dependent: :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true


	def self.search(search)
      if search
      	SellCd.where(['title LIKE ?', "%#{search}%"])
      else
        SellCd.all
      end
    end

		def favorited_by?(end_user)
		        favorites.where(end_user_id: end_user.id).exists?
		    end

end

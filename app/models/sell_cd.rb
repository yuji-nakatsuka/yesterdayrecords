class SellCd < ApplicationRecord
	attachment :image
	has_many :cd_artists
	has_many :carts
	has_many :discs
	has_many :order_contents
	belongs_to :label
	belongs_to :genre
	accepts_nested_attributes_for :discs, allow_destroy: true


	def self.search(search)
		return self.all unless search
		self.where(['content LIKE ?', "%#{search}%"])
	end
end


def self.search(search)
        return self.all unless search
        self.where(['content LIKE ?', "%#{search}%"])
    end
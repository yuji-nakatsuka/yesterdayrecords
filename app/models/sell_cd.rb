class SellCd < ApplicationRecord
	attachment :image
	has_many :cd_artists
	has_many :carts
	has_many :discs
	has_many :order_contents
	belongs_to :label,:genre
	accepts_nested_attributes_for :discs, allow_destroy: true
end

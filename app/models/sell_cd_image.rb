class SellCdImage < ApplicationRecord
	attachment :image
	belongs_to :sell_cd
end

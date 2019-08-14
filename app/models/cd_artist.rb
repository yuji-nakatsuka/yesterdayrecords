class CdArtist < ApplicationRecord
  belongs_to :sell_cd
  belongs_to :artist
end

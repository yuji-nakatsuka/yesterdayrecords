class Artist < ApplicationRecord
  has_many :sell_cd
  has_many :sell_cds, through: :cd_artists
end

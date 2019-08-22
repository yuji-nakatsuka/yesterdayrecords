class Disc < ApplicationRecord
  belongs_to :sell_cd
  has_many :songs
  accepts_nested_attributes_for :songs, allow_destroy: true
end

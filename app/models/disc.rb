class Disc < ApplicationRecord
  belongs_to :sell_cd
  accepts_nested_attributes_for :songs, allow_destroy: true
end

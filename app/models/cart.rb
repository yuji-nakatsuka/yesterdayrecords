class Cart < ApplicationRecord
  belongs_to :end_user
  belongs_to :sell_cd
end

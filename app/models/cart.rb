class Cart < ApplicationRecord
	belongs_to :end_user
	belongs_to :sell_cd

	# カート追加時にエラーになるから追加
		validates :quantity, presence: true

end
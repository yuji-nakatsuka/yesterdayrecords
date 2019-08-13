class DeliveryAddress < ApplicationRecord
	validates :zip , format: {with: /\A[0-9]{7}\z/}
end

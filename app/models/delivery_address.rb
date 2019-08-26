class DeliveryAddress < ApplicationRecord
	validates :zip , format: {with: /\A[0-9]{7}\z/}
	belongs_to :end_user
	accepts_nested_attributes_for :orders, allow_destroy: true
end

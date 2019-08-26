class Label < ApplicationRecord
  has_many :sell_cds, dependent: :destroy
   validates :label, presence: true, uniqueness: true

  	# label,genre,artistまとめたいな @admins/sell_cds
    def self.getlabelid
		labels = self.all
		i = 0
		labelid = Array.new(labels.size)
		labels.each do|label|
			labelid[i] = [label.label , label.id]
			i += 1
		end
		return labelid
	end
end

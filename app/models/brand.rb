class Brand < ActiveRecord::Base
	has_many :products

	validates :name, presence:true, length: { in: 2..20 }
	validates :description, length: { maximum: 50 }
end

class Category < ActiveRecord::Base
	has_many :products

	validates :name, presence:true, length: { in: 3..20 }
	validates :description, length: { maximum: 50 }
end

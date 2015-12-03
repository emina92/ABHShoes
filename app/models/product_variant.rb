class ProductVariant < ActiveRecord::Base
	belongs_to :product
	
	validates :size, presence:true
	validates :quantity, presence:true
end

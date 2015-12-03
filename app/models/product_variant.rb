class ProductVariant < ActiveRecord::Base
	belongs_to :product
	belongs_to :color
	
	validates :size, presence:true
	validates :quantity, presence:true
end

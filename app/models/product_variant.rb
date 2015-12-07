class ProductVariant < ActiveRecord::Base
	belongs_to :product
	belongs_to :color
	
	validates :size, presence:true
	validates :color_id, presence:true
	validates :quantity, presence:true, length: { maximum: 10000 }
end

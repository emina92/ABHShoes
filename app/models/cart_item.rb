class CartItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	def self.quantity_options
    	(1..10).to_a.collect{|p| ["#{p}", p]}
  	end
end

class User < ActiveRecord::Base
	has_many :cart_items
	has_many :shipping_addresses
  	rolify
	has_secure_password
	validates :password, presence:true, :on => :create, length: { in: 6..20 }
	validates :full_name, presence: true, length: { in: 6..50 }
	validates :email, presence: true, uniqueness: true,
										format: {
											with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
										}
	def total_quantity
		self.cart_items.sum(:quantity)
	end

	def total_price
		total = 0
		self.cart_items.each do |item|
			total += item.quantity * item.product.price
		end
		return total
	end

	def total_with_shipping
		total_price + 10
	end
end

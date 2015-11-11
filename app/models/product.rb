class Product < ActiveRecord::Base
	validates :title, presence:true
	validates :price, presence:true

	def image_name
		"obuca" + rand(1..8).to_s + ".jpg"
	end
end

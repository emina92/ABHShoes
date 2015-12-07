class Color < ActiveRecord::Base
	has_many :product_variants

	validates :name, presence:true
	validates :hex, presence:true

end

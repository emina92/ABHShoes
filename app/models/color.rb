class Color < ActiveRecord::Base
	belongs_to :product

	validates :name, presence:true
	validates :hex, presence:true

end

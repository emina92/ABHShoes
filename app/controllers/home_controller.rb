class HomeController < ApplicationController
	def index
		@products = Product.all
		@products_tmp = Product.where("created_at > ?", Time.now - 15.days)
		@products_new = @products_tmp.where("discount IS NULL")
		@products_sale = Product.get_discounted_items
	end
	
	def show
		@product = Product.find(params[:id])
	end
end

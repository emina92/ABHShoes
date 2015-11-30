class HomeController < ApplicationController
	def index
		@products = Product.all
		@products_new = Product.where("created_at > ?", Time.now - 15.days)
	end
	
	def show
		@product = Product.find(params[:id])
	end
end

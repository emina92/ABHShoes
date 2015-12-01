class StoreController < ApplicationController
	def show
		@category = Category.find(params[:id])
		@brand = Brand.find(params[:id])
		@min_price = params[:min_price]
		@max_price = params[:max_price]
		@brand_id = params[:brand_id]
		@color = params[:color]
		@size = params[:size]
		@products = @category.products
		@products = @products.where("price > ?", @min_price) if params[:min_price].present?
		@products = @products.where("price < ?", @max_price) if params[:max_price].present?
		@products = @products.where("brand_id = ?", @brand_id) if params[:brand_id].present?
		@products = @products.where("color = ?", @color) if params[:color].present?
		@products = @products.where("size = ?", @size) if params[:size].present?
	end
end

class StoreController < ApplicationController
  def show
  	 @category = Category.find(params[:id])
  end
end

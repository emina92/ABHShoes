class CartController < ApplicationController
  before_action :check_authentication, expect: [:index]
  
  def add
    @product_item = @current_user.cart_items.where("product_id = ?", params[:id]).first
    if @product_item
      @product_item.quantity = @product_item.quantity + 1
      @product_item.save
    else
      item = CartItem.new
      item.user = @current_user
      item.product = Product.find(params[:id])
      item.quantity = 1
      item.save
    end
    redirect_to :action => :index
  end

  def clear_cart
    @current_user.cart_items.delete_all
    redirect_to :action => :index
  end

  def index
    @cart_items = @current_user.cart_items.order(:id)
  end

  def set_quantity
    cart_item = @current_user.cart_items.find(params[:cart_item_id])
    quantity = params[:quantity]

    cart_item.quantity = quantity
    cart_item.save()

    redirect_to :action => :index
  end
end
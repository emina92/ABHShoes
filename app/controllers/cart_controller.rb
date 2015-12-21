class CartController < ApplicationController
  before_action :check_authentication, expect: [:index]
  before_action :set_no_sidebar
  
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

  def checkout
    @addresses = @current_user.shipping_addresses
    @address = ShippingAddress.new
  end

  def place_order
    @address = ShippingAddress.find(params[:address_id])
  end

  def create_charge
      # Amount in cents
      tmp = @current_user.total_price * 100
      @amount_dollar = @current_user.total_price + 10
      @amount = tmp.to_i

      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'ABH-Shoes order',
      :currency    => 'usd'
    )

    @current_user.cart_items.delete_all

  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def create_address
    @address = ShippingAddress.new(shipping_address_params)
    @address.user = @current_user
    @address.save
    redirect_to "/cart/place_order?address_id=#{@address.id}"
  end


  private
    def shipping_address_params
      params.require(:shipping_address).permit(:full_name, :address, :city, :state, :zip, :country, :phone_number, :user_id)
    end

    def set_no_sidebar
      @no_sidebar = true
    end
end
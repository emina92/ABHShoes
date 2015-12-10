class ChargesController < ApplicationController
	def new
	end

	def create
  		# Amount in cents
      temp = @current_user.total_price * 100
  		@amount = temp.to_i

  		customer = Stripe::Customer.create(
    	:email => params[:stripeEmail],
    	:source  => params[:stripeToken]
  		)

  	charge = Stripe::Charge.create(
    	:customer    => customer.id,
    	:amount      => @amount,
    	:description => 'Rails Stripe customer',
    	:currency    => 'usd'
  	)

	rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to new_charge_path
	end
end

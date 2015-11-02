class AdminController < ApplicationController

	before_filter:check_authentication
	
  def index
  end
end

class ColorsController < ApplicationController
	before_action :set_color, only: [:show, :edit, :update, :destroy]
  layout "admin"

	# GET /colors
	def index
		@colors = Color.all
	end

  # GET /color/1
  	def show
  	end

  	# GET /colors/new
  	def new
    	@color = Color.new
  	end

  	# GET /colors/1/edit
  	def edit
  	end

  	# POST /colors
  	def create
    	@color = Color.new(color_params)

    	if @color.save
      	redirect_to @color, notice: 'Color was successfully created.'
    	else
      	render :new
    	end
  	end

  	# PATCH/PUT /colors/1
  	def update
    	if @color.update(color_params)
      		redirect_to @color, notice: 'Color was successfully updated.'
    	else
      		render :edit
    	end
  	end

  	# DELETE /colors/1
  	def destroy
    	@color.destroy
    	redirect_to colors_url, notice: 'Color was successfully destroyed.'
  	end

  	private
    	# Use callbacks to share common setup or constraints between actions.
    	def set_color
      		@color = Color.find(params[:id])
    	end

    	# Never trust parameters from the scary internet, only allow the white list through.
    	def color_params
      		params.require(:color).permit(:name, :hex)
    	end
end

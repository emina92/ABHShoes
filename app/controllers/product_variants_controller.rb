class ProductVariantsController < AdminController
  before_action :set_product_variant, only: [:show, :edit, :update, :destroy]
  before_action :set_product

  # GET /product_variants
  def index
    
  end

  # GET /product_variants/1
  def show

  end

  # GET /product_variants/new
  def new
    @product_variant = ProductVariant.new
    @colors = Color.order(:name)
  end

  # GET /product_variants/1/edit
  def edit
    @colors = Color.order(:name)
  end

  # POST /product_variants
  def create
    @product_variant = ProductVariant.new(product_variant_params)
    @product_variant.product = @product
    if @product_variant.save
      redirect_to product_product_variant_path(@product, @product_variant), notice: 'ProductVariant was successfully created.'
    else
      @colors = Color.order(:name)
      render :new
    end
  end

  # PATCH/PUT /product_variants/1
  def update
    if @product_variant.update(product_variant_params)
      redirect_to product_product_variant_path(@product, @product_variant), notice: 'ProductVariant was successfully updated.'
    else
      @colors = Color.order(:name)
      render :edit
    end
  end

  # DELETE /product_variants/1
  def destroy
    @product_variant.destroy
    redirect_to product_product_variants_path(@product), notice: 'ProductVariant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_variant_params
      params.require(:product_variant).permit(:size, :quantity, :product_id, :color_id)
    end

end

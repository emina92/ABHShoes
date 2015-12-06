class ProductVariantsController < AdminController
  before_action :set_product_variant, only: [:show, :edit, :update, :destroy]

  # GET /product_variants
  def index
    @product_variants = ProductVariant.all
  end

  # GET /product_variants/1
  def show
  end

  # GET /product_variants/new
  def new
    @product_variant = ProductVariant.new
  end

  # GET /product_variants/1/edit
  def edit
  end

  # POST /product_variants
  def create
    @product_variant = ProductVariant.new(product_variant_params)

    if @product_variant.save
      redirect_to @product_variant, notice: 'ProductVariant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /product_variants/1
  def update
    if @product_variant.update(product_variant_params)
      redirect_to @product_variant, notice: 'ProductVariant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /product_variants/1
  def destroy
    @product_variant.destroy
    redirect_to product_variants_url, notice: 'ProductVariant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_variant_params
      params.require(:product_variant).permit(:size, :quantity, :product_id, :color_id)
    end

end

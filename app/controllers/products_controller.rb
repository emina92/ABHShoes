class ProductsController < AdminController
  before_action :set_product, only: [:show, :show_variant, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end
  def show_variant
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.order(:name)
    @brands = Brand.order(:name)
    @colors = Color.order(:name)
    @product.product_variants.build
  end

  # GET /products/1/edit
  def edit
    @categories = Category.order(:name)
    @brands = Brand.order(:name)
    @colors = Color.order(:name)
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      @categories = Category.order(:name)
      @brands = Brand.order(:name)
      @colors = Color.order(:name)
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      @categories = Category.order(:name)
      @brands = Brand.order(:name)
      @colors = Color.order(:name)
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image, :category_id, :brand_id, :discount,
        product_variants_attributes: [:id, :size, :quantity, :color_id, :_destroy])
    end
end

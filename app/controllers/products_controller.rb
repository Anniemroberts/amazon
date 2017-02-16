class ProductsController < ApplicationController

  before_action(:find_product, { only: [:show, :edit, :destroy, :update] })

  def new
    @product = Product.new #renders products/new.html.erb by default
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path({ id: @product })
    else
      flash.now[:alert] = 'Please fix errors'
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
    @user = :current_user
    @review = Review.new
  end

  def index
    @products = Product.order(created_at: :desc)
  end

  def edit
  end

  def update
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
  @product.destroy
  redirect_to products_path, notice: 'Product deleted!'
  end

  private

  def product_params
    # this feature is called strong parameters (introduced in Rails 4+)
    params.require(:product).permit([:title, :description, :price, :sale_price, :category_id])
  end

  def find_product
    @product = Product.find params[:id]
  end
end

class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to product_index_path
  end

  def create
    product = Product.create(product_params)

    redirect_to product_path(product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :quantity, :price)
  end

end

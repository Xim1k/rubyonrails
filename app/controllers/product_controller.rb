class ProductController < ApplicationController
  def index
    @user = current_user
    @products = Product.all
  end

  def show
    @user = current_user
    @product = Product.find(params[:id])
  end

  def new
    @user = current_user

    redirect_to product_index_path if !@user || !@user.manager?

    @product = Product.new
  end

  def edit
    @user = current_user

    redirect_to product_index_path if !@user || !@user.manager?

    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    redirect_to product_path(@product)
  end

  def destroy
    @user = current_user

    redirect_to product_index_path if !@user || !@user.manager?

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

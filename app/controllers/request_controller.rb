class RequestController < ApplicationController
  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    @free_operator = helpers.find_free_operator
    @quantity = params[:quantity]

    create_request(@user, @product, @free_operator, @quantity)

    redirect_to product_index_path
  end

  def create_request(user, product, free_operator, quantity)
    request = Request.new(status: Request::IN_PROGRESS, user: user,
                          operator: free_operator, product: product, quantity: quantity)
    request.save!

    product.quantity = product.quantity - quantity.to_i
    product.save!
  end

  def index
    @user = current_user
    redirect_to product_index_path if !@user || @user.client?

    @requests = Request.where(status: Request::IN_PROGRESS).find_each if @user.manager?
    @requests = Request.where(operator: @user, status: Request::IN_PROGRESS).find_each if @user.operator?
  end

  def finish
    @user = current_user
    @request = Request.find(params[:format])
    @request.status = Request::FINISHED
    @request.save!

    redirect_to request_index_path
  end

  def cancel
    @user = current_user
    @request = Request.find(params[:format])
    @request.status = Request::CANCELED
    @request.save!

    @product = @request.product
    @product.quantity = @product.quantity + @request.quantity
    @product.save!

    redirect_to request_index_path
  end
end

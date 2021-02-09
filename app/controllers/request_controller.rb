class RequestController < ApplicationController
    def create
        @user = current_user
        @product = Product.find(params[:format])
        @freeOperator = helpers.findFreeOperator
        request=Request.new(status: Request::IN_PROGRESS, user:current_user, operator:@freeOperator, product:@product, quantity: 1)
        request.save!

        redirect_to product_index_path
    end
end

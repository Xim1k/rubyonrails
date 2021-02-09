class IndexController < ApplicationController
    def index
        # user=User.first
        # operator=User.first
        # product=Product.first
        # request=Request.new(status:"123",user:user, operator:operator)
        # request.save
        @request=Request.first
        render 'index/index'
    end
end

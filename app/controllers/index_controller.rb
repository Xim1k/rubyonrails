class IndexController < ApplicationController
    def index
        u = User.new
u.email = 'yahoo'
u.username = 'kolbasa'
u.password = '1234'
u.password_confirmation = '1234'
u.save
        render 'index/index'
    end
end

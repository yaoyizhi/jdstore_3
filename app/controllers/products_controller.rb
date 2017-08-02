class ProductsController < ApplicationController
    before_action :authenticate_user!

    def show
        @product = Product.find(params[:id])
    end

    def index
        @products = Product.all
    end

    def add_to_cart
        @product = Product.find(params[:id])
        current_cart.add_product_to_cart(@product)
        flash[:notice] = '已成功加入购物车'
        redirect_to product_path
    end
end

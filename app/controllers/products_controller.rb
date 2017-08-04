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
        if !current_cart.products.include?(@product)
            current_cart.add_product_to_cart(@product)
            flash[:notice] = "已成功将 #{@product.title} 加入购物车"
        else
            flash[:warning] = '购物车里已有此商品'
            end
        redirect_to product_path
    end
end

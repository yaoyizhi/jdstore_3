class CartItemsController < ApplicationController
    def destroy
        @cart = current_cart
        @cart_item = @cart.cart_items.find_by(product_id: params[:id])
        @product = @cart_item.product
        @cart_item.destroy
        flash[:warning] = "已成功将#{@product.title}从购物车删除"
        redirect_to :back
    end

    def update
        @cart = current_cart
        @cart_item = @cart.cart_items.find_by(product_id: params[:id])
        @product = @cart_item.product
        redirect_to :back if @cart_item.update(cart_item_params)
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:quantity)
    end
end

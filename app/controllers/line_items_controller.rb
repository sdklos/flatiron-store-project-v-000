class LineItemsController < ApplicationController
  def create
    if current_user && current_user.current_cart
      @cart = current_user.current_cart
    elsif current_user
      @cart = current_user.create_current_cart(current_user.id)
    else
      @cart = Cart.create
    end
    @cart.add_item(params[:item_id])
    redirect_to cart_path(@cart)
  end

end

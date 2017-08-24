class CartsController < ApplicationController

  def update
    @order = Order.create
    redirect_to order_path(@order)
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @current_cart = Cart.find(params[:id])
    @current_cart.submit_cart
    @current_cart.update_inventory
    current_user.remove_cart
    redirect_to cart_path(@current_cart)
  end


end

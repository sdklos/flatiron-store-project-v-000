class OrdersController < ApplicationController
  def show
    @order = Order.new
  end
end

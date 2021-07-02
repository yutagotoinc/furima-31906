class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  

  def index
    @order = Order.new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
        @order_address.save
        redirect_to root_path
    else
       render 'orders/index'
    end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:zip_code,:prefecture_id,:city,:block_number,:building,:phone_number).merge(user_id: current_user.id,product_id: params[:product_id],token: params[:token])
  end

  def set_order
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @product.user.id || @product.order.present?
  end
end

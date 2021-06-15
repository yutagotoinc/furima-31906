class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new and return
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:description,:category_id,:status_id,:charge_id,:area_id,:duration_id,:price,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
    unless user_signed_in? && @product.user_id == current_user.id && @product.order.present?
      redirect_to action: :index
    end
  end

end

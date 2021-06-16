class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit]
  before_action :set_product, only: [:edit, :show, :update ,:destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]

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
  end

  def edit
  end
  
  
  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name,:description,:category_id,:status_id,:charge_id,:area_id,:duration_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in? && @product.user_id == current_user.id && @product.order.blank?
      redirect_to action: :index
    end
  end


end

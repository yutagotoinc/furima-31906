class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @Products = Product.all
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

  private

  def product_params
    params.require(:product).permit(:name,:description,:category_id,:status_id,:charge_id,:area_id,:duration_id,:price,:image).merge(user_id: current_user.id)
  end

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end

end

class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.includes(:category).published
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    unless @product.save
      flash.now[:notice] = fail_message(:creating)
      return render :new
    end

    redirect_to products_path, notice: success_message(:created)
  end

  def edit
    render :new
  end

  def update
    unless @product.update(product_params)
      flash.now[:notice] = fail_message(:updating)
      return render :new
    end

    redirect_to product_path(@product), notice: success_message(:updated)
  end

  def destroy
    message = fail_message(:destroying)
    message = success_message(:destroyed) if @product.destroy

    redirect_to products_path, notice: message
  end

  private

  def success_message(action)
    "You have successfully #{action} the product"
  end
  def fail_message(action)
    "There is an error when #{action}"
  end
  def find_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(
      :title,
      :description,
      :price,
      :published,
      :category_id,
      :level,
      :country)
  end
end

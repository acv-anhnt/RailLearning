class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).published
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'You have successfully created the product'
      redirect_to products_path
    else
      flash.now[:notice] = 'There is an error in your form'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :new
  end

  def update
    product_params = params.require(:product).permit(:title, :description, :price, :published, :category_id)
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'You have successfully updated the product'
      redirect_to product_path(@product)
    else
      flash.now[:notice] = 'There is an error when updating'
      render :new
    end
  end
end

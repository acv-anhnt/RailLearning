class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).published
  end
  def show
    @product = Product.includes(:category).find(params[:id])
  end
end

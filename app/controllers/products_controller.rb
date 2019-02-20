class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).published
  end
end

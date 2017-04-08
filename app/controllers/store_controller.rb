class StoreController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :initialize_cart
  
  def index
      @products = Product.all
  end
end

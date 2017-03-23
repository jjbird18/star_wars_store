class CartsController < ApplicationController
before_action :initialize_cart
before_action :authenticate_user!, except: [:index, :show]

def add
  @cart.add_item params[:id]
  session["cart"] = @cart.serialize
  product = Product.find(params[:id])
  redirect_to :back, notice: "Added #{product.name} to cart."

end

def remove
  cart = session['cart']
  item = cart['items'].find {|item| item ['product_id'] == params[:id] }
  if item
    cart['items'].delete item
  end
  redirect_to cart_path
end

def show
end

def checkout
  @order_form = OrderForm.new user: current_user #user: User.current_user
end

end

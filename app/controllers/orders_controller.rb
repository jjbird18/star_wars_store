class OrdersController < ApplicationController
  before_action :initialize_cart
  before_action :authenticate_user!, except: [:index, :show]



def create
  @user = current_user

  @order_form = OrderForm.new(
    user: @user,
    cart: @cart
)

if @order_form.save
  notify_user
  redirect_to products_path, notice: "Your order has been placed."
else
  render "carts/checkout"
 end
end





end

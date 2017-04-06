class OrdersController < ApplicationController
  before_action :initialize_cart
  before_action :authenticate_user!, except: [:index, :show]

def index
 @orders = Order.order(created_at: :desc).all
end


def create
  @user = current_user

  @order_form = OrderForm.new(
    user: @user,
    cart: @cart
)

if @order_form.save
  #notify_user
  if charge_user(@order_form.order)
  redirect_to root_path, notice: "Your order has been placed."
else
  flash[:warning] = <<EOF
  We have stored your order with the id of #{@order_form.order.id}.
  You should receive notification with the order details. However, something went wrong with the credit card. <br/>
  Please try again.
EOF
  redirect_to new_payment_order_path(@order_form.order)
end
else
  render "carts/checkout"
 end
end

def new_payment
  @order = Order.find pararms[:id]
  @client_token = Braintree::ClientToken.generate

end

def pay
  @order = Order.find params[:id]
  transaction = OrderTransaction.new @order, params[:payment_method_nonce]
  transaction.execute
  if transaction.ok?
    redirect_to root_path, notice: "Your order has been placed"
  else
    render "orders/new_payment"
 end
end

private

def charge_user(order)
  transaction = OrderTransaction.new order, params[:payment_method_nonce]
  transaction.execute
  transaction.ok?
end
#def notify_user
  #OrderMailer.order_confirmation(@order_form.order).deliver
#end



end

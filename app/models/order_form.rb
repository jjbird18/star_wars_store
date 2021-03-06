class OrderForm
include ActiveModel::Model

attr_accessor :user, :order #payment information added later on
attr_writer :cart

def save
  if valid?
      persist
      true
  else
      false
  end
end

private

def valid
  user.valid?
end

def persist
  @order = Order.create! user: user
  build_order_items
end

def build_order_items
    @cart.items.each do |item|
      @order.order_items.create! product_id: item.product_id, quantity: item.quantity
    end
  end


end

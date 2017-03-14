class CartsController < ApplicationController
before_action :initialize_cart

def add
  @cart.add_item params[:id]
  session["cart"] = @cart.serialize
  product = Product.find(params[:id])
  redirect_to :back, notice: "Added #{product.name} to cart."

end

def destroy
  @cart.items.destroy
  respond_to do |format|
    format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    format.json { head :no_content }
  end
end

def show

end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def initialize_cart
    @cart = Cart.build_from_hash session
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :city, :state, :country, :postal_code, :phone])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :city, :state, :country, :postal_code, :phone])
end

end

Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}


  get 'products/product'

  get 'pages/about'

  get 'welcome/index'
 root 'welcome#home'

 get 'pages/about' => 'pages#about'
get 'products/product' => 'products#product'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

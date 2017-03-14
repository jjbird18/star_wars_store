Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}


  resources :products

  resource :cart, only: [:show] do
    get "add/:id", :as => "add", action: 'add'
  end

  get 'products/index' => 'products#index'
  get 'pages/about'

  get 'welcome/index'
 root 'welcome#home'

 get 'pages/about' => 'pages#about'
#sget 'products/product' => 'products#product'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

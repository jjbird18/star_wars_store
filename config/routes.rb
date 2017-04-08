Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}


  resources :products

  resource :cart, only: [:show] do
    get "add/:id", :as => "add", action: 'add'
    delete 'remove', path: 'destroy/:id'
    get :checkout
  end


  resources :orders, only: [:index, :show, :create, :update] do
    member do
      get :new_payment
      post :pay
    end
  end

  resources :store do
    resources :products
  end

  get 'products/index' => 'products#index'
  get 'pages/about'

  get 'welcome/index'
 root 'welcome#home'

 get 'pages/about' => 'pages#about'


#sget 'products/product' => 'products#product'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

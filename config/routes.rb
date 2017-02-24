Rails.application.routes.draw do
  get 'products/product'

  get 'pages/about'

  get 'welcome/index'
 root 'welcome#home'

 get 'pages/about' => 'pages#about'
get 'products/product' => 'products#product'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

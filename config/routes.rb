Rails.application.routes.draw do
  get 'map/index'

  devise_for :users

  root 'hospitalk#index'
  get 'map/index'
  get 'hospitalk' => 'hospitalk#index'
  get 'hospitalk/search' => 'hospitalk#search'
  get 'hospitalk/new' => 'hospitalk#new'
  get  'usermaps/index'=> 'usermaps#index'
  post 'hospitalk' => 'hospitalk#create'
  get  'users/:id' => 'users#show'
  delete 'hospitalk/:id' => 'hospitalk#destroy'
  patch 'hospitalk/:id' => 'hospitalk#update'
  get  'hospitalk/:id/edit' => 'hospitalk#edit'
  get  'hospitalk/login'=>'hospitalk#login'
  get  'hospitalk/show/:id'=>'hospitalk#show'
  get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
  get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure

  resources :usermaps

end

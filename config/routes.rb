Rails.application.routes.draw do
  devise_for :users
  root 'hospitalk#index'
  get 'hospitalk' => 'hospitalk#index'
  get 'hospitalk/new' => 'hospitalk#new'
  post 'hospitalk' => 'hospitalk#create'
  get  'users/:id' => 'users#show'
  delete 'hospitalk/:id' => 'hospitalk#destroy'
  patch 'hospitalk/:id' => 'hospitalk#update'
  get  'hospitalk/:id/edit' => 'hospitalk#edit'
  get  'hospitalk/login'=>'hospitalk#login'
  get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
  get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure

end

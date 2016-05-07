Rails.application.routes.draw do
  devise_for :users
  root 'hospitalk#index'
  get 'hospitalk' => 'hospitalk#index'
  get 'hospitalk/new' => 'hospitalk#new'
  post 'hospitalk' => 'hospitalk#create'
end

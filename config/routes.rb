Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/index'
  get 'users/account'
  get 'users/profile'
  get 'users/sign_up' => 'users#new'
  get 'airphp/index'
  resources :users
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

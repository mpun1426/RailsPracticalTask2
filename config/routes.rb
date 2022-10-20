Rails.application.routes.draw do
  get 'users/index'
  get 'users/account'
  get 'users/profile'
  get 'users/sign_up' => 'users#new'
  get 'airphp/index'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

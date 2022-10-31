Rails.application.routes.draw do
  root to: 'airphp#index'
  get 'airphp/index'
  get 'airphp/reservations' => 'reservations#index'
  devise_for :users
  get 'users/account'
  get 'users/sign_up' => 'users#new'
  get 'rooms/index'
  get 'rooms/edit_select'
  get 'rooms/nonlogin'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  resources :reservations, only: [:index, :new, :create, :destroy]
  post 'reservations/new' => 'reservations/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

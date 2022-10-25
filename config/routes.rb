Rails.application.routes.draw do
  root to: 'airphp#index'
  get 'airphp/index'
  devise_for :users
  get 'users/account'
  get 'users/sign_up' => 'users#new'
  get 'rooms/index'
  get 'rooms/edit_select'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

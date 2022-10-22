Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/index'
  get 'users/account'
  get 'users/profile'
  get 'users/sign_up' => 'users#new'
  get 'airphp/index'
  get 'rooms/edit_select'
  resources :users
  resources :rooms do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

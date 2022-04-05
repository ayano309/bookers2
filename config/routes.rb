Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: 'homes#index'
  get "homes/about" => "homes#about", as: "about"
  resources :books
  resources :users ,only: [:index, :show, :edit, :update]
end

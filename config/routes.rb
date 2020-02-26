Rails.application.routes.draw do
  devise_for :users
  get 'pages/about', to: 'pages#about'
  get 'pages/contact', to: 'pages#contact'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:show, :new, :create, :edit, :update, :destroy]
end

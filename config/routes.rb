Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, exept: :index do
    resources :reservations, except: :index
  end
  get 'pages/about', to: 'pages#about'
  get 'pages/contact', to: 'pages#contact'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

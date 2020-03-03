Rails.application.routes.draw do
  devise_for :users
  resources :users, except: %i[index new create]
  get 'restaurants/calc_occupation', to: 'restaurants#calc_occupation'
  resources :restaurants do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, except: [:index, :new, :create]
  get 'pages/about', to: 'pages#about'
  get 'pages/contact', to: 'pages#contact'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    resources :reservations, except: :index
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

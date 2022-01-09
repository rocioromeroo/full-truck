Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root to: 'pages#home'
  resources :freights do
    resources :reservations, only: %i[new create]
    resources :reviews, only: :create
  end

  resources :trucks
  post "checkout/create", to: "checkout#create"

  post "freights", to: "freights#index"

  get "reservations", to: "reservations#index"

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end

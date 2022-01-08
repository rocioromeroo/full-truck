Rails.application.routes.draw do
  get 'welcome/index'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root to: 'pages#home'
  resources :freights do
    resources :reservations, only: %i[new create]
    resources :reviews, only: :create
  end

  resources :trucks

  post "freights", to: "freights#index"

  get "reservations", to: "reservations#index"

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end

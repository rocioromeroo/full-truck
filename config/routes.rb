Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :freights, :reservations, :reviews, :trucks

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end

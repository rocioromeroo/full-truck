Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :freights, :reservations, :reviews, :trucks
end

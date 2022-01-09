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
  # get 'success', to: 'pages#success'
  get 'success', to: 'pages#success' do
    @freight = Freight.find(params[:id])
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(session.customer)
  end
end

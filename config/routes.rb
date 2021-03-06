Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root "events#index"
  get "pages/politika"

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]
    post :show, on: :member
  end
  resources :users, only: %i[show edit update]
  get '/404', to: "errors#not_found"
end

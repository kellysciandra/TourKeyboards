Rails.application.routes.draw do

  get '/keyboards/my_keyboards', to: 'keyboards#index', as: 'my_keyboards'
  
  resources :keyboards

  resources :line_items, only: [:create, :edit, :update]
  resources :carts, only: [:show, :edit]
  resources :artists, only: [:show] do
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  #extend devise to use omniauth_callbacks controller 
  authenticated :user do
    root 'keyboards#index', as: 'authenticated_root'
  end

  resources :authentications, only: [:destroy]
  
  devise_scope :user do
    root 'devise/sessions#new'
  end

end
Rails.application.routes.draw do

  get '/keyboards/my_keyboards', to: 'keyboards#my_keyboards', as: 'my_keyboards'

  resources :keyboards

  resources :artists, only: [:show] do
    resources :keyboards, only: [:show, :index, :new]
  end
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  authenticated :user do
    root 'store#index', as: 'authenticated_root'
  end
  resources :authentications, only: [:destroy]
  
  devise_scope :user do
    root 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :line_items, only: [:create, :edit, :update]
  resources :carts, only: [:show, :edit]

end

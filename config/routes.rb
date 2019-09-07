Rails.application.routes.draw do

  devise_for :installs
  get '/keyboards/my_keyboards', to: 'keyboards#my_keyboards', as: 'my_keyboards'

  resources :keyboards

  resources :artists, only: [:show] do
    resources :keyboards, only: [:show, :index, :new]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'store#index', as: 'store'

  resources :line_items, only: [:create, :edit, :update]
  resources :carts, only: [:show, :edit]

end

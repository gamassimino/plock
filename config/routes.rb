Rails.application.routes.draw do
  root to: "home#index"
  get 'profile', to: 'users#show'
  resources :companies

  devise_for :users
  resources :users
  get 'me/dataUser' => 'users#dataUser', :defaults => { :format => 'json' }

  resources :teams
  resources :teams do
    get 'accept_invitation', on: :collection
  end
  resources :tracks
  resources :projects do
    resources :tracks
    
  end
  get 'me/dataProject' => 'projects#dataProject', :defaults => { :format => 'json' }
end

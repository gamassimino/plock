Rails.application.routes.draw do
  root to: "home#index"
  get 'profile', to: 'users#show'
  resources :companies do
      get 'subscribe_user'
      get 'send_email'
      get 'accept_invitation_to_company', on: :collection
  end


  devise_for :users
  resources :users
  get 'me/dataUser' => 'users#dataUser', :defaults => { :format => 'json' }

  get 'search_project', to: 'search#search_project'
  get 'search_team', to: 'search#search_team'
  get 'search_track', to: 'search#search_track'
  get 'search_user', to: 'search#search_user'
  
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

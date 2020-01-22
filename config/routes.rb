Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  root to: "home#index"
  get 'profile', to: 'users#show'
  resources :companies do
      get 'subscribe_user'
      get 'send_email'
      get 'accept_invitation_to_company', on: :collection
  end

  devise_for :users
  resources :users

  resources :teams do
    get 'accept_invitation', on: :member
  end
  resources :tracks
  resources :projects do
    resources :tracks
  end

  get 'me/dataUser' => 'users#dataUser', :defaults => { :format => 'json' }
  get 'me/dataProject' => 'projects#dataProject', :defaults => { :format => 'json' }
end

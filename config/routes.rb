Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  root to: "home#index"
  get 'profile', to: 'users#show'
  resources :companies

  devise_for :users
  resources :users
  get 'me/data' => 'users#data', :defaults => { :format => 'json' }

  resources :teams
  resources :teams do
    get 'accept_invitation', on: :collection
  end
  resources :tracks
  resources :projects do
    resources :tracks
  end
end

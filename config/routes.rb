Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
  root to: "leagues#index"

  delete '/leagues/:league_id', to: 'teams#destroy', as: 'team_destroy'

  resources :users
  resources :leagues do
    resources :teams, :except => ['destroy']
  end

  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post '/leagues/:id/draft', to: 'drafts#create', as: 'create_draft'
  get '/leagues/:id/draft', to: 'drafts#show', as: 'draft'
  post '/leagues/:league_id/player_teams', to: 'player_teams#create', as: 'create_player_team'
  post 'leagues/:id/draft/comments', to: 'comments#create', as: 'create_comment'
  get '/about', to: 'about#index'
end

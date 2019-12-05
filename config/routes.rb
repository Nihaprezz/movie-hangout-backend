  Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

  get '/popular/:page', to: 'movie#popular'
  get '/movie/:id', to: 'movie#movieDetails'
  get '/movies', to: 'movie#all'
  get '/top_rated', to: 'movie#topRated' 
  get '/upcoming', to: 'movie#upcoming'
  get '/now_playing', to: 'movie#nowPlaying'

  get '/comments', to: 'comment#index'
  get '/comments/movie/:movieApiID', to: 'comment#movie'
  post '/comments', to: 'comment#create'
  delete '/comments/:id', to: 'comment#destroy'
end



Rails.application.routes.draw do
  # resources :posts, only: [:index, :show]
  # resources :user_followers
  # resources :users, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/latest/:id', to: 'posts#getLatest'

  get '/postDetail/:id', to: 'posts#showDetail'

  get '/getComments/:id', to: 'posts#getComments'

  post '/createPost/', to: 'posts#createNew'

  post '/createComment', to: 'posts#createComment'

  post '/login', to: 'sessions#create'
  post '/createUser', to: 'users#createAccount'
  delete '/logout', to: 'sessions#delete'
end

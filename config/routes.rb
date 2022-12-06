Rails.application.routes.draw do
  # resources :posts
  # resources :user_followers
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/latest/:id', to: 'posts#getLatest'

  get '/postDetail/:id', to: 'posts#showDetail'

  post '/createPost/', to: 'posts#createNew'

  post '/createComment', to: 'posts#createComment'
end

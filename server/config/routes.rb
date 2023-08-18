Rails.application.routes.draw do
  resources :songs
  #get 'home/index'
  root "home#index"#imposta come root home index (non serve usare endpoint home/index)

  get "playlist", to: "home#playlist"

  get "mysongs", to: "songs#index"

  get "signup", to: "registration#signup"
  post "signup", to: "registration#create"

  get "signin", to: "session#signin"
  post "signin", to: "session#create"

  delete "logout", to: "session#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

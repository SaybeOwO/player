Rails.application.routes.draw do
  #get 'home/index'
  root "home#index"#imposta come root home index (non serve usare endpoint home/index)

  get "playlist", to: "home#playlist"

  get "addsong", to: "song#addsong"
  post "addsong", to: "song#create"

  get "signup", to: "registration#signup"
  post "signup", to: "registration#create"

  get "signin", to: "session#signin"
  post "signin", to: "session#create"

  delete "logout", to: "session#destroy"

  #get 'sign_up', to "registrations#signup"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

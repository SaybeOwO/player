Rails.application.routes.draw do
  #get 'home/index'
  root 'home#index'#imposta come root home index (non serve usare endpoint home/index)

  get 'home/menu'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

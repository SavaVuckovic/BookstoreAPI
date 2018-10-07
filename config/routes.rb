Rails.application.routes.draw do
  #categories
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  # books
  resources :books
  root 'books#index'
  # coments
  # ...
end

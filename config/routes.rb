Rails.application.routes.draw do
  #categories
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  get '/categories/:id/books', to: 'categories#books'

  # books
  resources :books
  root 'books#index'

  # coments
  post '/comments', to: 'comments#create'
end

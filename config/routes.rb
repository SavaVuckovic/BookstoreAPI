Rails.application.routes.draw do
  #categories
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  get '/categories/:id/books', to: 'categories#books'
  post '/categories', to: 'categories#create'
  delete '/categories/:id', to: 'categories#destroy'

  # books
  resources :books
  get '/books/:id/comments', to: 'books#comments'
  root 'books#index'

  # coments
  post '/comments', to: 'comments#create'
  delete '/comments/:id', to: 'comments#destroy'
end

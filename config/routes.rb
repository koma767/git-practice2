Rails.application.routes.draw do

  get 'books/new'

  root to: 'homes#top'
  post 'books' => 'books#create'
  get 'books/:id/top' => 'books#top', as: 'top_book'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'books' => 'books#index', as: 'index_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

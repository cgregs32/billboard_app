Rails.application.routes.draw do
  root 'static_pages#index'

  resources :billboards


  resources :artists do
    resources :songs
  end

  get '/billboard/:id/find_song/:id', to: 'billboards#find_song', as: 'find_song'
  patch '/billboard/:id/add_song/', to: 'billboards#add_song', as: 'add_song'
  patch '/billboard/:id/remove_song/:song_id', to: 'billboards#remove_from_bill', as: 'remove_song'
end

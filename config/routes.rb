Rails.application.routes.draw do

  resources :billboards do
    resources :songs
  end
end

SrBujInAction::Application.routes.draw do

  root to: 'lists#index'

  resources :lists do
    resources :todos
  end


end

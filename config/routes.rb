SrBujInAction::Application.routes.draw do
  root to: 'example/lists#index'

  namespace :example do
    resources :lists do
      resources :todos
    end
  end
end

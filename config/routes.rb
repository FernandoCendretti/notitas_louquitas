Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users', to: 'users#create'
      get 'users/show', to: 'users#show'
      patch 'users/update/plans', to: 'users#update_plan'
      post 'sessions', to: 'sessions#create'

      post 'folders', to: 'folders#create'
      get 'folders', to: 'folders#index'
      get 'folders/:id', to: 'folders#show'
      patch 'folders/:id', to: 'folders#update'

      post 'notes', to: 'notes#create'
      put 'notes', to: 'notes#update'
      get 'notes/:id', to: 'notes#show'

      post 'tags', to: 'tags#create'
    end
  end
end

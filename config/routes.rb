Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users', to: 'users#create'
      get 'users/show', to: 'users#show'
      post 'sessions', to: 'sessions#create'
    end
  end
end

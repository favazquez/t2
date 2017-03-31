Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/usuario/:id2', to: 'users#show'
  post '/usuario/:id2', to: 'users#edit'
  delete '/usuario/:id2', to: 'users#destroy'
  get '/usuario', to: 'users#index'
  put '/usuario', to: 'users#create'
end

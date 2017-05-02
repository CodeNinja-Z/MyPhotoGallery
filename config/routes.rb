Rails.application.routes.draw do
  root 'photos#landing'

  resources :photos, only: [:index, :show]
  # resources :likes, only: [:create, :destroy]
  post '/photos/:photo_id/like', to: 'likes#create', as: 'like_photo'
  delete '/photos/:photo_id/unlike', to: 'likes#destroy', as: 'unlike_photo'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get]
  match '/signout', to: 'sessions#destroy', as: 'sign_out', via: [:delete]
end

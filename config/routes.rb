Rails.application.routes.draw do
  root 'photos#landing'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get]
  match '/signout', to: 'sessions#destroy', as: 'sign_out', via: [:delete]

  resources :photos, only: [:index]
end

Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'pages#home'

  get '/:id' => 'events#show', as: :event

  resources :events, only: [:new, :create]
end

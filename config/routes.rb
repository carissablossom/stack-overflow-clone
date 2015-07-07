Rails.application.routes.draw do

  get 'sessions/new'

  resources :questions do
    resources :answers
  end

  resources :users
  get 'signup' => 'users#new'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end

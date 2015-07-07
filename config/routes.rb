Rails.application.routes.draw do

  resources :questions do
    resources :answers
  end

  # resources :users
  # get '/signup' => 'users#new'
end

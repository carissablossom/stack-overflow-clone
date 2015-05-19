Rails.application.routes.draw do

  get 'questions/edit'

  resources :questions do
    resources :answers
  end
  root 'questions#index'

end

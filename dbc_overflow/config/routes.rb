Rails.application.routes.draw do
  get 'answers/new'

  get 'answers/create'

  get 'answers/show'

  get 'questions/new'

  get 'questions/create'

  get 'questions/show'

  resources :questions
  resources :answers

  root 'welcome#index'

end

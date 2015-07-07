Rails.application.routes.draw do
	root 'questions#index'

  resources :questions do
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
    resources :answers do
      member do
        put "like", to: "answers#upvote"
        put "dislike", to: "answers#downvote"
      end
    end
  end

  resources :users
  get 'signup' => 'users#new'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end

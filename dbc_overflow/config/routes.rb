Rails.application.routes.draw do

  resources :questions do
    resources :answers
  end
  root 'questions#index'





    post 'questions/:id/upvote' => 'questions#upvote', :as => 'upvote'
    post 'questions/:id/downvote' => 'questions#downvote', :as => 'downvote'
    post 'answers/:id/upvote' => 'answers#upvote', :as => 'upvote_answer'
    post 'answers/:id/downvote' => 'answers#downvote', :as => 'downvote_answer'


end

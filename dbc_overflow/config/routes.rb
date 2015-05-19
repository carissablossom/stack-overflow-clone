Rails.application.routes.draw do

  # get 'questions/edit' This was auto-generated. Not needed

  resources :questions do
    patch 'upvote', to: 'questions#upvote'
    patch 'downvote', to: 'questions#downvote'
    resources :answers do
      patch 'upvote', to: 'answers#upvote'
      patch 'downvote', to: 'answers#upvote'
    end
  end
  root 'questions#index'



  # put 'questions/:question_id/answers/:id#upvote'

  # put 'questions/:question_id/answers/:id#downvote'
end

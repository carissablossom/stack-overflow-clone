Rails.application.routes.draw do

  scope '/api' do
    scope '/v1' do
      scope '/questions' do
        get '/' => 'questions#index'
        post '/' => 'questions#create'
        scope '/:question_id' do
          get '/' => 'questions#show'
          delete '/' => 'questions#destroy'
          put '/' => 'questions#update'
          put '/' => 'questions#upvote'
          put '/' => 'questions#downvote'
          scope '/answers' do
            get '/' => 'answers#index'
            post '/' => 'answers#create'
            scope '/:answer_id' do
              get '/' => 'answers#show'
              put '/' => 'answers#update'
              put '/' => 'answers#upvote'
              put '/' => 'answers#downvote'
            end
          end
        end
      end
    end
  end
end




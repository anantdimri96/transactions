Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      put '/transactionservice/transaction/:transaction_id', to: 'transactions#create', format: true
      get '/transactionservice/transaction/:transaction_id', to: 'transactions#show', format: true
      get 'transactionservice/types/:type', to: 'transactions#type', format: true
      get '/transactionservice/sum/:transaction_id', to: 'transactions#calculate_sum', format: true
    end
  end
end

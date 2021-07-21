Rails.application.routes.draw do
  root 'checkers#new'

  get '/health' => 'monitors#show', defaults: { format: 'json' }
end

Rails.application.routes.draw do
  root 'checkers#new'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/health' => 'monitors#show', defaults: { format: 'json' }

  get '/api' => 'documentations#api'

  get '/ip'       => 'api/checkers#ip'
  get '/hostname' => 'api/checkers#hostname'
  get '/city'     => 'api/checkers#city'
  get '/region'   => 'api/checkers#region'
  get '/country'  => 'api/checkers#country'
  get '/loc'      => 'api/checkers#loc'
  get '/asn'      => 'api/checkers#asn', defaults: { format: 'json' }
  get '/json'     => 'api/checkers#json'
  get '/ua'       => 'api/checkers#ua'

  get '*unmatched_route' => 'application#route_not_found'
end

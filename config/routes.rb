Rails.application.routes.draw do
  root 'checkers#new'

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

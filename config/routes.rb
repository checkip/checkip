Rails.application.routes.draw do
  root 'checkers#new'

  get '/health' => 'monitors#show', defaults: { format: 'json' }

  get '/ip'       => 'api/checkers#ip'
  get '/hostname' => 'api/checkers#hostname'
  get '/city'     => 'api/checkers#city'
  get '/region'   => 'api/checkers#region'
  get '/country'  => 'api/checkers#country'
  get '/loc'      => 'api/checkers#loc'
  get '/asn'      => 'api/checkers#asn'
  get '/json'     => 'api/checkers#json'
end

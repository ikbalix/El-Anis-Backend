require 'api_constraints'
Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
  
  match '*path', via: [:options], to:  lambda {|_| [204, {'Access-Control-Allow-Headers' => "Origin, Content-Type, Accept, Authorization, Token", 'Access-Control-Allow-Origin' => "*", 'Content-Type' => 'text/plain'}, []]}
  namespace :api, defaults: { format: :json }, path: 'api' do    
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      mount_devise_token_auth_for 'User', at: 'auth', base_controller: 'Api::V1::BaseController'
      namespace :users do
 
        get '/volunteers' => 'users#volunteers'
        get '/myteam' => 'users#myteam'
        get '/map' => 'users#map'
        post '/updatePosition' => 'users#updatePosition'
      end

      namespace :volunteers do
 
        post '/' => 'volunteers#create'

      end
    end
  end
end

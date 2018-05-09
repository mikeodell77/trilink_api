Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api/v1' do
    resources :chainsaw, only: [:index]
    get '/brands' => 'chainsaw#brands'
    get '/models' => 'chainsaw#models'
    get '/barlengths' => 'chainsaw#barlengths'
    get '/pitches' => 'chainsaw#pitches'
    get '/gauges' => 'chainsaw#gauges'
    get '/kickbacks' => 'chainsaw#kickbacks'
    get '/replacements' => 'chainsaw#index'
    get '/depot_link' => 'chainsaw#depot_link'
  end
end

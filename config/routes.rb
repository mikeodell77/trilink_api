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

    get '/hd_brands' => 'chainsaw#hd_brands'
    get '/hd_models' => 'chainsaw#hd_models'
    get '/hd_barlengths' => 'chainsaw#hd_barlengths'
    get '/hd_pitches' => 'chainsaw#hd_pitches'
    get '/hd_gauges' => 'chainsaw#hd_gauges'
    get '/hd_kickbacks' => 'chainsaw#hd_kickbacks'

    get '/depot_link' => 'chainsaw#depot_link'
  end
end

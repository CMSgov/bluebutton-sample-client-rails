Rails.application.routes.draw do

  namespace :bluebutton do
    # Main demo landing page to perform initial authorization
    #get 'authorize', to: 'demo#authorize', as: 'authorize'
    get 'authorize', to: 'demo#authorize', as: 'authorize'

    # Oauth2 callback/redirect
    #get 'callback', to: 'demo#callback', as: 'callback'
    get 'callback', to: 'demo#callback', as: 'callback'

    # Main demo page after auth with resource demo links
    #get 'main', to: 'demo#main', as: 'main'
    get 'main', to: 'demo#main', as: 'main'

    namespace :resources do
      # Bluebutton resource: userinfo 
      get 'userinfo', to: 'resources#userinfo', as: 'userinfo'

      # Bluebutton resource: patient
      get 'patient', to: 'resources#patient', as: 'patient'

      # Bluebutton resource: eob = Explanation of Benefit 
      get 'eob', to: 'resources#eob', as: 'eob'

      # Bluebutton resource: Coverage  
      get 'coverage', to: 'resources#coverage', as: 'coverage'

      # Bluebutton resource: OIDC Discovery 
      get 'oidc', to: 'resources#oidc', as: 'oidc'

      # Bluebutton resource: FHIR Metadata 
      get 'fhirmeta', to: 'resources#fhirmeta', as: 'fhirmeta'

      # Bluebutton resource: get_resource (for JSON responses with paging links)
      get 'get_resource', to: 'resources#get_resource', as: 'get_resource'

    end
  end
  resources :applications

  root 'bluebutton/demo#authorize'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # Main demo landing page to perform initial authorization
  get 'bluebutton_authorize', to: 'bbdemo#bluebutton_authorize', as: 'bluebutton_authorize'

  # Bluebutton Oauth2 callback/redirect
  get 'bluebutton_callback', to: 'bbdemo#bluebutton_callback', as: 'bluebutton_callback'

  # Bluebutton endpoints demos 
  get 'bluebutton_endpoints', to: 'bbdemo#bluebutton_endpoints', as: 'bluebutton_endpoints'

  # Bluebutton endpoint: userinfo 
  get 'bluebutton_endpoint_userinfo', to: 'bbdemo#bluebutton_endpoint_userinfo', as: 'bluebutton_endpoint_userinfo'

  # Bluebutton endpoint: patient
  get 'bluebutton_endpoint_patient', to: 'bbdemo#bluebutton_endpoint_patient', as: 'bluebutton_endpoint_patient'

  # Bluebutton endpoint: eob = Explanation of Benefit 
  get 'bluebutton_endpoint_eob', to: 'bbdemo#bluebutton_endpoint_eob', as: 'bluebutton_endpoint_eob'

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> c0da3a7... Add coverage, oidc discovery, and FHIR metadata calls
  # Bluebutton endpoint: Coverage  
  get 'bluebutton_endpoint_coverage', to: 'bbdemo#bluebutton_endpoint_coverage', as: 'bluebutton_endpoint_coverage'

  # Bluebutton endpoint: OIDC Discovery 
  get 'bluebutton_endpoint_oidc', to: 'bbdemo#bluebutton_endpoint_oidc', as: 'bluebutton_endpoint_oidc'

  # Bluebutton endpoint: FHIR Metadata 
  get 'bluebutton_endpoint_fhirmeta', to: 'bbdemo#bluebutton_endpoint_fhirmeta', as: 'bluebutton_endpoint_fhirmeta'

<<<<<<< HEAD
=======
>>>>>>> ab2d7f7... Add ExplanationOfBenefit endpoing call. Will add paging later
=======
>>>>>>> c0da3a7... Add coverage, oidc discovery, and FHIR metadata calls
  resources :applications

  root 'bbdemo#bluebutton_authorize'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

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

  resources :applications

  root 'bbdemo#bluebutton_authorize'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

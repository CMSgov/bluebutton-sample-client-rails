class ApplicationController < ActionController::Base
  require 'bluebutton_oauth_service'

  def refresh_token
    @bluebutton_oauth_service.refresh_access_token
  end

  # Remember state parameter for Oauth2
  def change_session_bb_state
    session[:bb_state]  = SecureRandom.hex(16)
  end

  # auth/refresh. Place this in a before_action in any controller needing access to the Bluebutton API.
  def bluebutton_oauth_service_check
    change_session_bb_state

    # Setup oauth2 client service
    @bluebutton_oauth_service = BluebuttonOauthService.new(session[:bb_acc_token],session[:bb_state])


    if session[:bb_acc_token]
      @bluebutton_oauth_service.restore_access_token
      if @bluebutton_oauth_service.expired?
        refresh_token
        # Save access token to session
        session[:bb_acc_token] = @bb_application_user.bb_acc_token
      end	
    end
  end
end

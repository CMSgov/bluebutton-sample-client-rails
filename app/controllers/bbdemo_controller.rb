class BbdemoController < ApplicationController
  before_action :bluebutton_oauth_service_check

  def bluebutton_authorize
    # Change state param on every authorize
    change_session_bb_state
  end

  # Handler for Bluebutton authorization redirect/callback
  def bluebutton_callback
    bluebutton_oauth_service = BluebuttonOauthService.new(session[:bb_acc_token],session[:bb_state])
    bluebutton_oauth_service.set_access_token(params[:code])
    bluebutton_oauth_service.refresh_access_token
    redirect_to bluebutton_endpoints_path, :notice => "you have been successfully authorized!"
    # Save access token to session.  
    session[:bb_acc_token] = bluebutton_oauth_service.bb_acc_token
  end

  def bluebutton_endpoints
    # Get and save patient id for page displays
    @bb_acc_token_json = JSON.parse(session[:bb_acc_token])
    session[:bb_patient_id] = @bb_acc_token_json['patient']
  end

  def bluebutton_endpoint_userinfo
    bluebutton_oauth_service = BluebuttonOauthService.new(session[:bb_acc_token],session[:bb_state])
    bluebutton_oauth_service.restore_access_token
    @bb_response = bluebutton_oauth_service.bb_get_userinfo
  end

  def bluebutton_endpoint_patient
    bluebutton_oauth_service = BluebuttonOauthService.new(session[:bb_acc_token],session[:bb_state])
    bluebutton_oauth_service.restore_access_token
    @bb_response = bluebutton_oauth_service.bb_get_patient(session[:bb_patient_id])
  end
end

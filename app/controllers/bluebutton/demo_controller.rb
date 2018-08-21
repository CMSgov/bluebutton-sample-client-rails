class Bluebutton::DemoController < ApplicationController
  before_action :bluebutton_oauth_service_check

  def authorize
    # Change state param on every authorize
    change_session_bb_state
    # Setup oauth2 client service
    @bluebutton_oauth_service = BluebuttonOauthService.new(session[:bb_acc_token],session[:bb_state])
  end

  # Handler for Bluebutton authorization redirect/callback
  def callback
    @bluebutton_oauth_service = BluebuttonOauthService.new(session[:bb_acc_token],session[:bb_state])
    @bluebutton_oauth_service.set_access_token(params[:code])
    @bluebutton_oauth_service.refresh_access_token
    redirect_to bluebutton_main_path, :notice => "you have been successfully authorized!"
    # Save access token to session.  
    session[:bb_acc_token] = @bluebutton_oauth_service.bb_acc_token
  end

  def main
    # Get and save patient id for page display
    @bb_acc_token_json = JSON.parse(session[:bb_acc_token])
    session[:bb_patient_id] = @bb_acc_token_json['patient']
  end

end

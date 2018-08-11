require 'oauth2'

class BluebuttonOauthService

  BB_CLIENT_ID = LOCAL_ENV['BB_CLIENT_ID']
  BB_CLIENT_SECRET = LOCAL_ENV['BB_CLIENT_SECRET']
  BB_REDIRECT_URI = LOCAL_ENV['BB_REDIRECT_URI']
  BB_AUTHORIZE_URL = LOCAL_ENV['BB_AUTHORIZE_URL']
  BB_TOKEN_URL = LOCAL_ENV['BB_TOKEN_URL']
  BB_BASE_URL = LOCAL_ENV['BB_BASE_URL']
  BB_REFER_URL = 'http://localhost:3000/bluebutton_authorize'

  attr_accessor :bb_acc_token, :state 

  def initialize(bb_acc_token, state)
    @bb_acc_token = bb_acc_token
    @state = state
    @client = OAuth2::Client.new(BB_CLIENT_ID, BB_CLIENT_SECRET, {
      :authorize_url => BB_AUTHORIZE_URL,
      :token_url => BB_TOKEN_URL,
      :site => BB_BASE_URL,
      :state => state,
      :raise_errors => false
    })
  end

  def get_authorize_url
    url = @client.auth_code.authorize_url({
      :redirect_uri => BB_REDIRECT_URI,
      :state => state
    })
    url #return link for browser.
  end

  def set_access_token(code=nil)
    @access_token = @client.auth_code.get_token(code,
					       	:redirect_uri => BB_REDIRECT_URI,
					        :headers => { :Referer => BB_REDIRECT_URI })
    @serialized_access_token = @access_token.to_hash.to_json
    @bb_acc_token = @serialized_access_token
    nil
  end

  def restore_access_token
    @serialized_access_token = bb_acc_token
    @access_token = OAuth2::AccessToken.from_hash @client,
    {:refresh_token => JSON.parse(@serialized_access_token)['refresh_token'],
    :access_token => JSON.parse(@serialized_access_token)['access_token'],
    :expires_at => JSON.parse(@serialized_access_token)['expires_at']}
    nil
  end

  def expired?
    restore_access_token unless @access_token
    @access_token.expired?
  end

  def access_token_object
    restore_access_token unless @access_token
    @access_token
  end

  def access_token
    restore_access_token unless @access_token
    @access_token.token
  end

  def refresh_token
    restore_access_token unless @access_token
    @access_token.refresh_token
  end

  def refresh_access_token
    restore_access_token unless @access_token
    @access_token = @access_token.refresh!
    @serialized_access_token = @access_token.to_hash.to_json
    @bb_acc_token = @serialized_access_token
    nil
  end

  # Endpoint methods:

  def bb_get_userinfo
    response_json = @access_token.get('/v1/connect/userinfo').body
    JSON.parse(response_json)
  end

  def bb_get_patient(patient_id)
    response_json = @access_token.get("/v1/fhir/Patient/#{patient_id}").body
    JSON.parse(response_json)
  end

  def bb_get_eob(patient_id)
    response_json = @access_token.get("/v1/fhir/ExplanationOfBenefit/?patient=#{patient_id}").body
    JSON.parse(response_json)
  end

end


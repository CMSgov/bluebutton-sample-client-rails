class Bluebutton::Resources::ResourcesController < ApplicationController
  before_action :bluebutton_oauth_service_check


  # Set resource title for result template
  def resource_title(t)
    @resource_title = t
  end

  def userinfo
    resource_title('User Info')
    @bb_response = @bluebutton_oauth_service.bb_get_userinfo
    render('result')
  end

  def patient
    resource_title('Patient Information')
    @bb_response = @bluebutton_oauth_service.bb_get_patient(session[:bb_patient_id])
    render('result')
  end

  def eob
    resource_title('Explanation Of Benefit')
    @bb_response = @bluebutton_oauth_service.bb_get_eob(session[:bb_patient_id])
    render('result')
  end

  def coverage
    resource_title('Coverage')
    @bb_response = @bluebutton_oauth_service.bb_get_coverage(session[:bb_patient_id])
    render('result')
  end

  def oidc
    resource_title('OIDC Discovery')
    @bb_response = @bluebutton_oauth_service.bb_get_oidc
    render('result')
  end

  def fhirmeta
    resource_title('FHIR Metadata')
    @bb_response = @bluebutton_oauth_service.bb_get_fhirmeta
    render('result')
  end

  def get_resource
    resource_title(params[:resource_title])
    @bb_response = @bluebutton_oauth_service.get_resource(params[:page_url])
    render('result')
  end
end

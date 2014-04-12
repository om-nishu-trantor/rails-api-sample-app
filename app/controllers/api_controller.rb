class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # rescue_from ActionController::RoutingError, :with => :render_not_found

  def invalid_request
     render :json => {:message => 'The request is not valid'}, :status => 422
  end

  def resource_class
    User
  end

  def require_api_authentication
    return invalid_request if request.env['HTTP_AUTHENTICATION_TOKEN'].blank?
    @user = resource_class.where("authentication_token  = ?",  request.env['HTTP_AUTHENTICATION_TOKEN'] ).first
    return invalid_request  if @user.blank?
    return time_out_message if timed_out
    return @user
  end

  def current_user
    @user
  end

  def timed_out
    (current_user.current_sign_in_at.utc + time_out) <= Time.now.utc
  end

  def time_out
    5.minutes
  end

  def logged_in?
    !current_user.session_id.blank?
  end

  def time_out_message
    render :json => {:message => "You can not access this action. In order to access api, please login again"}
  end


end

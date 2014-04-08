class Api::V1::SessionsController <  ApiController

  before_filter :ensure_params_exist, :only => :create
  before_filter :require_api_authentication, :only => :destroy

  #  /api/v1/sign_in
  def create
    @resource = resource_class.find_for_database_authentication(:email => params[:user_login][:email])
    if @resource && @resource.valid_password?(params[:user_login][:password])
      successful_login
      render :json => {:auth_token => @resource.authentication_token, :email=> @resource.email}, :status => 201
    else
      invalid_login_attempt
    end
  end

  #  /api/v1/sign_out
  def destroy
     logger.info "** signing out **"
     sign_out(current_user)
  end

  protected

  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json => {:success => false, :message => "missing user_login parameter" }, :status => 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json => {:success => false, :message => "Error with your login or password"}, :status => 401
  end

  def successful_login
    sign_in(@resource, :force => true)
  end

end

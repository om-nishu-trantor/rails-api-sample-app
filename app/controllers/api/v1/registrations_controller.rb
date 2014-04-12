class Api::V1::RegistrationsController <  ApiController

  respond_to :json

  #
  # /api/v1/registrations.json
  #
  def create
    user  = User.new(user_params)
    if user.save
      render :json => {:message => "A confirmation token has been sent to your email. Please insert the token to proceed"}, :status => 201
    else
      render :json => {:errors => user.errors}, :status => 422
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

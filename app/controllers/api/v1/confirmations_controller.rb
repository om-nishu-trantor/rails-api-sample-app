class Api::V1::ConfirmationsController < ApiController


    #
    # /api/v1/confirmations.json
    #
    def create
      invalid_request and return  if params[:confirmation_token].blank?
      resource = resource_class.confirm_by_token(params[:confirmation_token])
      if resource.errors.empty?
         resource.confirm!
         render :json => {:message => 'The account has been confirmed. You can login now with your credentials'}, :status => 201
      else
         render :json => {:message => 'Invalid token, account has not been confirmed yet', :errors => resource.errors}, :status => 422
      end
    end

end

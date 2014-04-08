class Api::V1::TasksController < ApiController
  include ActionController::MimeResponds

  before_filter :require_api_authentication

  def create

  end

  def index
    @tasks = Task.all
    respond_to do |format|
      format.json { render json: @tasks }
      format.xml { render xml: @tasks }
    end
  end

  def show

  end

end

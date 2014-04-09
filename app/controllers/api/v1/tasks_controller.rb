class Api::V1::TasksController < ApiController

  before_filter :require_api_authentication

  def create

  end

  #
  # /api/v1/tasks.json
  #
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show

  end

end

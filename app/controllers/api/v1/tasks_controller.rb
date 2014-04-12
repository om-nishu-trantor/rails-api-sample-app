class Api::V1::TasksController < ApiController

  before_filter :require_api_authentication

  def create
    task =  current_user.tasks.build(task_params)
    if task.save
      render :json => {:message => 'Task created successfully', :id => task.id }, :status  => 201
    else
      render :json => { :errors => task.errors }, :status => 422
    end
  end

  #
  # /api/v1/tasks.json
  #
  def index
    @tasks = current_user.tasks
    render json: @tasks
  end

  #
  # /api/v1/task/<task_id>
  #
  def show
    task = current_user.tasks.where(id: params[:id]).first
    unless task
      render :json => {:error => "Task does not exists"}
    else
      render :json => {:id => task.id, :name => task.name, :created_at => task.created_at }
    end
  end


  private

  def task_params
    params.require(:task).permit(:name)
  end
end



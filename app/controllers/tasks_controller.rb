class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json

  include ActionController::MimeResponds

  def index
    @tasks = Task.all
    respond_to do |format|
      format.json { render json: @tasks }
      format.xml { render xml: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    render json: @task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    if @task.update(params[:task])
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end

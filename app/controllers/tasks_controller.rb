class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]

  def index
    @tasks = Task.where(status: 0)
  end

  def show
    @marker =
      {
        lat: @task.latitude,
        lng: @task.longitude
      }
  end

  def mytasks
    # Tasks
    t_query = params[:status] ? { user_id: current_user, status: params[:status] } : { user_id: current_user }
    @tasks = Task.where(t_query)

    # Assignments
    if params[:assigned] == "1"
      validated = true
    else
      validated = false
    end
    a_query = params[:assigned] ? { user_id: current_user, validated: validated } : { user_id: current_user }
    @assignments = Assignment.where(a_query)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save!
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        # format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        # format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
    @task.save!
  end

  def task_params
    params.require(:task).permit(:action, :status, :location, :price, :date, :user_id)
  end
end

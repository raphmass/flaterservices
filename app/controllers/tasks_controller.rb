class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def mytasks
    if params[:assigned]
      query = { user_id: current_user, status: Task::STATUS[params[:assigned].to_i] }
    else
      query = { user_id: current_user }
    end
    @tasks = Task.where(query)
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

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def mytasks
    @tasks = Task.where(user_id: current_user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
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
    params.require(:task).permit(:name)
  end
end

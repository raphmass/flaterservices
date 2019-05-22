class TasksController < ApplicationController
  before_action :set_task, only: [:mytasks, :show, :destroy]

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
    # @all_tasks = Task.where(user_id: current_user).order('id DESC')
    @all_tasks = current_user.tasks.order('id DESC')
    # ASSIGNEMENT WHERE TASK_ID == CURRENT_USER.TASKS.ID && COUNT > 0
    @tasks_to_assign = @all_tasks.where(status: 0).order('id DESC') # OK
    # @tasks_to_assign = Assignment.where(task_id: @all_tasks)
    # ASSIGNEMENT WHERE TASK_ID == CURRENT_USER.TASKS.ID && ASSIGNEMENT.VALIDATED TRUE && TASK.STATUS != DONE
    @tasks_in_progress = Task.first(10)
    # ASSIGNEMENT WHERE TASK_ID == CURRENT_USER.TASKS.ID && ASSIGNEMENT.VALIDATED TRUE && TASK.STATUS == DONE
    @tasks_done = Task.last(10)

    # @tasks_to_assign = Task.all.joins(:@assigments).where(assignment: { user: current_user })
    # @tasks_to_assign = Task.all.joins(:assigments).where('assigments.user_id = ?', current_user.id)

    # Assignments
    if params[:assigned] == "1"
      validated = true
    else
      validated = false
    end
    a_query = params[:assigned] ? { user_id: current_user, validated: validated } : { user_id: current_user }
    @my_assignments = Assignment.where(a_query)
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
    # All tasks
    @tasks = Task.all
    # User tasks
    if current_user
      @my_tasks = Task.where(user_id: current_user)
      @my_assignments = Assignment.where(user_id: current_user)
    end
    # Task details
    if params[:id]
      @task = Task.find(params[:id])
    end
  end

  def task_params
    params.require(:task).permit(:action, :status, :location, :price, :date, :user_id)
  end
end

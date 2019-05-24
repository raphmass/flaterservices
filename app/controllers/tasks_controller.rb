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
    # My tasks (as owner)
    @all_tasks = current_user.tasks.order('status ASC, id ASC')
    @tasks_to_assign = @all_tasks.where('tasks.id NOT IN (SELECT task_id FROM assignments a WHERE a.validated = TRUE)')
    @tasks_in_progress = @all_tasks.joins(:assignments).where(assignments: { validated: true }, status: 0..1).uniq
    @tasks_done = @all_tasks.joins(:assignments).where(assignments: { validated: true }, status: '2').uniq

    ### DEBUG
    # p @all_tasks.ids
    # p @tasks_to_assign.map(&:id)
    # p @tasks_in_progress.map(&:id)
    # p @tasks_done.map(&:id)
    # p @all_tasks.ids - @tasks_to_assign.map(&:id) - @tasks_in_progress.map(&:id) -@tasks_done.map(&:id)

    # My assignments (as concierge)
    @tasks_validated = current_user.tasks_validated
    @tasks_applied = current_user.tasks_applied
    # @tasks_applied = @my_assignments.where(validated: false)
    # TOUTES LES TACHES AUXQUELLES J'AI POSTULÉES QUI SONT VALIDÉES PAR UN AUTRE USER_ID
    @tasks_missed = current_user.tasks_missed
    # @tasks_missed = @assignments.where(task: @tasks_applied, validated: true).where.not(user: current_user)
    # @tasks_missed = @assignments.where(id: @my_assignments.id, validated: true).where_not(user_id: current_user)
    # @tasks_missed = @assignments.where(validated: true).where_not(user_id: current_user)
    # @tasks_missed = @assignments.where(user_id: current_user).where(validated: true)

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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
  end

  private

  def set_task
    # All tasks
    @tasks = Task.all
    @assignments = Assignment.all
    # User tasks
    if current_user
      @my_tasks = Task.where(user_id: current_user)
      # @my_assignments = Assignment.where(user_id: current_user)
      @my_assignments = current_user.owned_tasks
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

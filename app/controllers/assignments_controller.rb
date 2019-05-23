class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :destroy]

  def index
    @assignments = Assignment.all
  end

  def show
  end

  def edit
  end

  def new
    @task = Task.find(params[:task_id])
    @assignment = Assignment.new
  end


  def create
    @assignment = Assignment.new
    @assignment.task = Task.find(params[:task_id])
    @assignment.user_id = current_user.id

    @assignment.save

    redirect_to my_tasks_path

  end

  private

  def set_assignment
    @assignment = assignment.find(params[:id])
    @assignment.save!
  end

end

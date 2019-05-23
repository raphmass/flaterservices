class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :destroy]

  def index
    @assignments = Assignment.all
  end

  def show
  end

  def update
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

  def valid
    @assignment = Assignment.find(params[:id])
    @assignment.update(validated: true)
    redirect_back(fallback_location: root_path)
  end

  def reject
    @assignment = Assignment.find(params[:id])
    @assignment.update(validated: false)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_assignment
    @assignment = assignment.find(params[:id])
    @assignment.save!
  end

end

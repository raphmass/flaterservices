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
    @assignment = Assignment.new(assignment_params)
    @assignment.task = Task.find(params[:task_id])
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_assignment
    @assignment = assignment.find(params[:id])
    @assignment.save!
  end

  def assignment_params
    params.require(:assignment).permit(:name)
  end
end

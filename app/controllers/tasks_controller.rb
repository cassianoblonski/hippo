class TasksController < ApplicationController
  before_action :set_project
  before_action :set_history
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_person!

  def index
    @tasks = @history.tasks
  end

  def show
  end

  def new
    @task = @history.tasks.new
  end

  def create
    @task = Task.new(task_params)
    @task.history_id = @history.id

    if @task.save
      flash[:success] = "Task was successfully created."
      redirect_to [@project, @history]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "#{@task.name} was successfully updated."
      redirect_to [@project, @history, @task]
    else
      render 'edit'
    end
  end

  def destroy
  end

  def toggle
    @task = Task.find(params[:task_id])

    if @task != nil?
      @task.toggle!(:done)
    else
      set_flash "Error, please try again"
    end
  end

  private
    def task_params
      params.require(:task).permit(:description,:done,:history_id,:project_id)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def set_history
      @history = History.find(params[:history_id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end

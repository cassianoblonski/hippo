class TasksController < ApplicationController
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
      flash[:success] =  I18n.t(:success,
                                scope: [:flash, :actions, 'create'],
                                resource: "Task")
      redirect_to [@history.project, @history]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] =  I18n.t(:success,
                                scope: [:flash, :actions, 'update'],
                                resource: "Task")
      redirect_to [@history.project, @history, @task]
    else
      render 'edit'
    end
  end

  def destroy
  end

  def toggle
    @task = Task.find(params[:task_id])

    @task.toggle!(:done)
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
end

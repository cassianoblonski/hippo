class HistoriesController < ApplicationController
  before_action :authenticate_person!
  before_action :set_project
  before_action :set_history, only: [ :show, :edit, :update ]

  def index
    @histories = @project.histories
  end

  def show
  end

  def new
    @history = @project.histories.new
  end

  def create
    @history = History.new(history_params)
    @history.project_id = @project.id

    if @history.save
      flash[:success] =  I18n.t(:success,
                                scope: [:flash, :actions, 'create'],
                                resource: "History")
      redirect_to [@project, :histories]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @history.update(history_params)
      flash[:success] =  I18n.t(:success,
                                scope: [:flash, :actions, 'update'],
                                resource: "History")
      redirect_to [@project, @history]
    else
      render 'edit'
    end
  end

  def destroy
  end

  def next_status
    @history = History.find(params[:history_id])

    if @history.status == 'started' && @history.tasks.unfinished.present?
      flash[:danger] =  I18n.t(:unfinished_tasks, scope: [:flash, :actions, 'next_status'])
    else
      @history.update_attribute(:status, @history.increment_status)
    end

    redirect_to project_histories_path
  end

  def reset_status
    @history = History.find(params[:history_id])
    @history.update_attribute(:status, 'pending')

    redirect_to project_histories_path
  end

  private
    def history_params
      params.require(:history).permit(:name, :status, :description, :deadline,
                                      :points, :project_id, :requester_id, :owner_id)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_history
      @history = History.find(params[:id])
    end
end

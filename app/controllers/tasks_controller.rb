class TasksController < ApplicationController
  before_action :require_logged_user

  def index
    @task = Task.new
    # Lista todas os registros somente no scopo do usuario logado.
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_path,
        notice: t('flash.task.create.notice')
    else
      render :new
    end
  end

  private

  def task_params
    params
     .require(:task)
     .permit(:title)
  end
end

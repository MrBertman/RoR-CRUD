class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks.all.order(:expiry)
    respond_to do |format|
      format.html{render 'tasks/index'}
      format.json{render :json => {tasks: @tasks}}
    end
  end

  def create
    task = current_user.tasks.create(task_create_params)
    if task.errors.empty?
      #TaskCleanerWorker.perform_at(task.expiry, task.id)
      redirect_to '/'
    else
      flash[:error] = []
      task.errors.full_messages.each do |msg|
        flash[:error] << msg
      end
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to '/'
    end
  end

  def update
    task = current_user.tasks.find_by(id: params[:id])
    if task && params[:task]
      task.update!(task_update_params)
    end
    redirect_to '/'
  end

  def delete
    task = current_user.tasks.find_by(id: params[:id])
    if task
      #TaskMailer.task_deleted(task).deliver_later(wait: 5.minute)
      task.destroy!
    end
    redirect_to '/'
  end

  def update_locale
    user = User.find(current_user.id)
    user.update(:locale => params[:locale])
    redirect_back(fallback_location: root_path)
  end

  def task_create_params
    params.require(:task).permit(:name, :description, :importance, :expiry, :done)
  end

  def task_update_params
    params.require(:task).permit(:name, :description, :importance, :expiry, :done)
  end
end

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
    if task.valid?
      redirect_to '/'
    else
      if task.errors.any?
        flash[:alert] = []
        task.errors.full_messages.each do |msg|
          flash[:alert] << msg
        end
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
      task.destroy!
    end
    redirect_to '/'
  end

  def update_locale
    user = User.find(current_user.id)
    user.update(:locale => params[:locale])
    redirect_to '/'
  end

  def task_create_params
    params.require(:task).permit(:name, :description, :importance, :expiry, :done)
  end

  def task_update_params
    params.require(:task).permit(:name, :description, :importance, :expiry, :done)
  end
end

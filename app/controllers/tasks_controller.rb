class TasksController < ApplicationController

  def index
    @tasks = Task.where(user_id: current_user.id).order("created_at DESC")
  end

  def new
    @task = current_user.tasks.new
  end

  def show
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, Time.now)
    redirect_to tasks_path, notice: "Item successfully completed!"
  end

  private
    def task_params
      params.require(:task).permit(:content, :description)
    end

    def find_task
      @task = Task.find(params[:id])
    end

end

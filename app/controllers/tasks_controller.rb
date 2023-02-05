class TasksController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(restaurant_params)
    @task.save
    redirect_to restaurant_path(restaurant)
  end

  def edit
  end

  def update
    @task.update(restaurant_params)
    redirect_to restaurant_path(restaurant)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
end

private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

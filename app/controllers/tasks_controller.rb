class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit]
 
  def index
    @tasks = Task.all
  end

  def show
   
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'task が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が作成されませんでした'
      render :new
    end
  end  

  def edit
   
  end
  
  private
  
   def set_task
    @task = Task.find(params[:id])
  end

  
  def task_params
    params.require(:task).permit(:content, :title)
 end
end


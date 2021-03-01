class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:edit, :show, :update, :destroy]


  def index
     if logged_in?
#       @user = current_user
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(25)
    end
  end

  def create
    # ログインユーザのIDでタスクを作成する
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが正常に登録されませんでした'
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
#削除    @task = Task.find(params[:id])
  end

  def show
#削除   @task = Task.find(params[:id])
  end

  def update
#削除    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが正常に更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end

  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content,:status)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
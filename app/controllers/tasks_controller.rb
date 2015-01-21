class TasksController < ApplicationController

  before_filter :authenticate_user!,:only => [:index, :show, :new, :edit, :update, :destroy]

	def index
		@tasks = Task.all
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def new
	end

	def create
		@task = Task.new(task_params)

    if @task.save
      format.html { redirect_to @task, notice: 'Task was successfully created.' }
      format.json { render action: 'show', status: :created, location: @task }
    else
      render json: {task_params: @task.errors}, status: 422
    end
	end

	def update 
		@task = Task.find(params[:task][:id])
		if @task.update(task_params)
      format.html { redirect_to @task, notice: 'Task was successfully created.' }
      format.json { render action: 'show', status: :created, location: @task }
		else
			render json: {task_params: @task.errors}, status: 422
		end
	end

	def destroy
	end


def task_params
    return nil if params[:task].blank?
    params.require(:task).permit(Task::PERMITTED_ATTRS)
  end

end

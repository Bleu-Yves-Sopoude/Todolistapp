class TasksController < ApplicationController
    before_action :set_task, only: [ :show, :edit, :update, :destroy ]


    def index

        if params[:status].present?
            @tasks = Task.where(status: params[:status])
        else
          @tasks = Task.all
        end

        if params[:sort_by]= 'created_at'
            @tasks = @tasks.order(created_at: :desc)
        elsif
            params[:sort_by]='updated_at'
            @tasks = @tasks.order(updated_at: :desc)
        else
            @tasks = @tasks.order(created_at: :desc)
        end
    end

    def new
        @task = Task.new()
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to @task, notice: "Task was successfully created"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to @task, notice: "Task was succesfully updated"
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to tasks_url, notice: "task was succesfully deleted"
    end

    private



    def task_params
        params.require(:task).permit(:name, :description, :status)
    end

    def set_task
        @task= Task.find(params[:id])
    end
end

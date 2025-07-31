class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :delete]


    def index
        @tasks = Task.all
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

    def delete
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

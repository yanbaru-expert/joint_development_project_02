class TasksController < ApplicationController

  def new
    @task = Task.new
  end
  
  def create
    Task.create(task_params)
    
  end
  
end

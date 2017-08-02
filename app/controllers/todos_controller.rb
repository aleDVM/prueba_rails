class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @todo = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def show
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def complete
    @todo.completed = true
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
    @todos1 = @todos.select { |k| k[:completed] == true }
    @todos2 = @todos.select { |k| k[:completed] == false }
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end

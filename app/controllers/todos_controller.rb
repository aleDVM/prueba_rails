class TodosController < ApplicationController
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
    @todo = Todo.find(params[:id])
  end
  def edit
    @todo = Todo.find(params[:id])
  end
  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end
  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    redirect_to todos_path
  end
  def list
    @todos = Todo.all
    @todos1 = @todos.select { |k| k[:completed] == true }
    @todos2 = @todos.select { |k| k[:completed] == false }
  end
  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end

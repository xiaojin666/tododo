class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render 'new'
  end
end

  def destroy
    todo = Todo.find params[:id]
    if todo.destroy
      redirect_to todos_path
    end
  end

  def update
    todo = Todo.find params[:id]
    todo.update todo_params
    redirect_to todos_path
  end

  def edit
    @todo =Todo.find params[:id]
  end
  private
  def todo_params
    todo_params = params.require(:todo).permit(:title,:finished)
  end
end

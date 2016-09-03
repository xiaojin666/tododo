class TodosController < ApplicationController
  before_action :authenticate!

  def index
    @todos = @current_user.todos
   @todo= Todo.new
 end

 private
  def authenticate!
    @current_user = User.find_by(id: session[:user_id])
    if @current_user.blank?
      redirect_to login_path and return
    end
  end

end

  def show
  end

  def new
    @todo = Todo.new
  end

def create
  todo = Todo.new(todo_params)
  todo.user_id = @current_user.id
  if todo.save!
    redirect_to todos_path
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

class TodosController < ApplicationController
  def new
   @todo = Todo.new
  end 
  
  def create
    @todo = Todo.new(todo_params)
  if @todo.save
    flash[:notice] = "Item Listed succesfully"
    redirect_to todo_path(@todo)
  else render 'new'
  end
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.new(todo_params)
  if @todo.save
    flash[:notice] = "Item Listed succesfully"
    redirect_to todo_path(@todo)
  else
    render 'edit'
  end
  end
  
  def index
    @todos = Todo.all
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Deleted successfully"
    redirect_to todos_path
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
end
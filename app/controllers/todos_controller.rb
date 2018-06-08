class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "De Todo is aangemaakt."
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
    # redirect_to todo_path(@todo) => "te vaak omgeleid"
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "De Todo is bijgewerkt."
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
end

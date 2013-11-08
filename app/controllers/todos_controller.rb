class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :checked]
  
  before_action :get_todos

  def index
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    
    if @todo.save
      redirect_to todos_path, notice: 'Todo was successfully created.'
    else
      redirect_to :back, alert: "Your todo content is empty."
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'Todo was successfully updated.'
    else
      redirect_to :back, alert: "Your todo content is empty."
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_url, notice: "Todo was successfully deleted."
  end

  def get_todos
    @todos = Todo.order(:created_at).reverse_order
  end
  
  def checked
    @todo.checked == true ? @todo.update_attribute(:checked, false) : @todo.update_attribute(:checked, true)
    redirect_to :back, notice: "Todo status was changed."
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:content, :checked)
    end
end

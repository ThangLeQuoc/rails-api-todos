class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /todos
  def create
    # TODO @thangle: what is the exclamation mark at this method do ?
    # Answer: In our create method in the TodosController, note that we're using create! instead of create. This way, the model will raise an exception ActiveRecord::RecordInvalid. This way, we can avoid deep nested if statements in the controller. Thus, we rescue from this exception in the ExceptionHandler module.
    @todo = Todo.create!(todo_params)
    # TODO @thangle: what initialize this created variable ?
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private def todo_params 
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

end

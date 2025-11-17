class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy toggle_done ]

  # GET /todos or /todos.json
  def index
    @todos = Current.user.todos.all.reverse
  end

  # GET /todos/new
  def new
    @todo = Current.user.todos.new
  end

  def show
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Current.user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: "Todo was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Todo was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def filter_low
    @todos = Current.user.todos.where(priority: 0)
  end

  def filter_medium
    @todos = Current.user.todos.where(priority: 1)
  end

  def filter_high
    @todos = Current.user.todos.where(priority: 2)
  end

  def toggle_done
    @todo.update(done: true)
    redirect_to @todo, notice: "Todo Completed!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Current.user.todos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :body, :done, :priority)
    end
end

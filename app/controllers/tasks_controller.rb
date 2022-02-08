class TasksController < ApplicationController

  # GET /tasks or /tasks.json
  def index
    @category = Category.find(params[:category_id])
    @tasks = @category.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  # GET /tasks/new
  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  # POST /tasks or /tasks.json
  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new(task_params)
      if @task.save
        flash[:notice] = "Task was successfully created." 
        redirect_to category_path(@category)
      else 
        return
      end

  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
      if @task.update(task_params)
        flash[:notice] = "Task was successfully updated."
        redirect_to category_path(@category)
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task was successfully deleted."
      redirect_to category_path(@category)
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :body, :task_date)
    end
end

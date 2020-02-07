class Statics::ProjectsController < ApplicationController
  protect_from_forgery with: :null_session

  def projects_table
    render json: Project.all
  end

  def index
    @record = 'projects'
    render 'statics/index'
  end

  def new
    @model = Project.new
    render 'statics/new'
  end

  def edit
    render 'statics/edit'
  end

  def create
    project = Project.new project_params
    if project.save
      render json: {status: :ok}
    else
      puts project.errors.full_messages
      render json: {status: :internal_server_error}
    end
  end

  def update
  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:name, :repository, :cost, :start_at, :user_id)
  end
end
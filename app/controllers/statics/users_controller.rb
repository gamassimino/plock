class Statics::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def users_table
    render json: User.all
  end

  def user_select
    users = User.all.map{ |u| [u.name, u.id] }
    render json: users
  end

  def index
    @record = 'users'
    render 'statics/index'
  end

  def new
    @model = User.new
    render 'statics/new'
  end

  def edit
    render 'statics/edit'
  end

  def create
    user = User.new user_params
    if user.save
      render json: {status: :ok}
    else
      render json: {status: :internal_server_error}
    end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :lastname, :email, :password, :company_id)
  end
end
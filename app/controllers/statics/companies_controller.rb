class Statics::CompaniesController < ApplicationController
  protect_from_forgery with: :null_session

  def companies_table
    render json: Company.all
  end

  def companies_select
    companies = Company.all.map{ |c| [c.name, c.id] }
    render json: companies
  end

  def index
    @record = 'companies'
    render 'statics/index'
  end

  def new
    @model = Company.new
    render 'statics/new'
  end

  def edit
    render 'statics/edit'
  end

  def create
    company = Company.new company_params
    if company.save
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
  def company_params
    params.require(:company).permit(:id, :name, :description, :company, :email, :user_id)
  end
end
class Statics::CompaniesController < ApplicationController
  def companies_table
    render json: Company.all
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
  end

  def update
  end

  def destroy
  end
end
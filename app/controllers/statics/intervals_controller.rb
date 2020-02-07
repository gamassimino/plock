class Statics::IntervalsController < ApplicationController
  protect_from_forgery with: :null_session

  def intervals_table
    render json: Interval.all
  end

  def index
    @record = 'intervals'
    render 'statics/index'
  end

  def new
    @model = Interval.new
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
class Statics::TracksController < ApplicationController
  protect_from_forgery with: :null_session

  def tracks_table
    render json: Track.all
  end

  def index
    @record = 'tracks'
    render 'statics/index'
  end

  def new
    @model = Track.new
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

  private
  def track_params
    params.require(:track).permit(:name, :description, :plock_time, :status)
  end
end
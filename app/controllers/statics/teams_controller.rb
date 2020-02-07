class Statics::TeamsController < ApplicationController
  protect_from_forgery with: :null_session

  def teams_table
    render json: Team.all
  end

  def index
    @record = 'teams'
    render 'statics/index'
  end

  def new
    @model = Team.new
    render 'statics/new'
  end

  def edit
    render 'statics/edit'
  end

  def create
    team = Team.new team_params
    if team.save
      params[:team][:user_ids].each do |user_id|
        TeamUser.create(team_id: team.id, user_id: user_id, incorporated_at: DateTime.now)
      end
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
  def team_params
    params[:team][:user_ids] = params.dig(:team, :user_ids).to_a.reject(&:empty?).map(&:to_i).compact
    params.require(:team).permit(:name, user_ids: [])
  end
end
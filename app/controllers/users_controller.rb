class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = current_user
        @projects = @user.projects
    end

    def dataUser
      render json: current_user.tracks.map {|track| {
        task: track.name,
        hour: track.plock_time }
      }.reject(&:empty?)  
    end
    
end
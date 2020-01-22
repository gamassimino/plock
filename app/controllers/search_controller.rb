class SearchController < ApplicationController

    def search_project
        @project = params[:q].nil? ? [] : Project.search(params[:q])
    end

    def search_team
        @team = params[:q].nil? ? [] : Team.search(params[:q])
    end

    def search_track
        @track = params[:q].nil? ? [] : Track.search(params[:q])
    end

    def search_user
        @user = params[:q].nil? ? [] : User.search(params[:q])
        puts "--------------------------------------------------------"
        puts User.search(params[:q]).to_json
        puts "--------------------------------------------------------"
    end

end

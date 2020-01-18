# frozen_string_literal: true

module Types
  # class QueryType
  #
  class QueryType < Types::BaseObject
    def current_user 
      context[:current_user]
    end

    field :project, ProjectType, null: true do
      description 'Find a Project by ID'
      argument :id, ID, required: true
    end
    def project(id:)
      Project.find(id)
    end

    field :user, UserType, null: true do
      description 'Find a User by ID'
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :team, TeamType, null: true do
      description 'Find a team by ID'
      argument :id, ID, required: true
    end
    def team(id:)
      Team.find(id)
    end

    field :company, CompanyType, null: true do
      description 'Find a company by ID'
      argument :id, ID, required: true
    end
    def company(id:)
      Company.find(id)
    end

    field :projects,
      [ProjectType],
      null: true,
      description: 'Returns a list of projects created by the user registered in plock'
    def projects
      current_user.projects
    end

    field :tracks_user,
      [TrackType],
      null: true,
      description: 'Returns a list of user logged projects into plock'
    def tracks_user
      current_user.tracks
    end
  end
end

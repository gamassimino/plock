# frozen_string_literal: true

module Types
  # class QueryType
  #
  class QueryType < Types::BaseObject
    # EXAMPLE
    field :test_field,
          String,
          null: false,
          description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end

    field :project, ProjectType, null: true do
      description 'Find a Project by ID'
      argument :id, ID, required: true
    end
    def project(id:)
      Project.find(id)
    end

    field :projects,
          [ProjectType],
          null: false,
          description: 'Returns a list of projects in the plock'
    def projects
      Project.all
    end

    field :projects_user, [ProjectType], null: true do
      description 'Find all Project by User'
      argument :id, ID, required: true
    end
    def projects_user(id:)
      Project.where('user_id = ?', id)
    end

    field :projects_company, [ProjectType], null: true do
      description 'Find all Project by Company'
      argument :id, ID, required: true
    end
    def projects_company(id:)
      Project.where('company_id = ?', id)
    end

    field :projects_team, [ProjectType], null: true do
      description 'Find all Project by Team'
      argument :id, ID, required: true
    end
    def projects_team(id:)
      Project.where('team_id = ?', id)
    end

    field :tracks_user, [TrackType], null: true do
      description 'Find all Tracks by User'
      argument :id, ID, required: true
    end
    def tracks_user(id:)
      Track.where('user_id = ?', id)
    end

    field :tracks_user_finished, [TrackType], null: true do
      description 'Find all finished tracks by user'
      argument :id, ID, required: true
    end
    def tracks_user_finished(id:)
      Track.where('user_id = ? AND status = TRUE', id)
    end

    field :tracks_user_not_finished, [TrackType], null: true do
      description 'Find all not finished tracks by user'
      argument :id, ID, required: true
    end
    def tracks_user_not_finished(id:)
      Track.where('user_id = ? AND status = FALSE', id)
    end

    field :tracks_project, [TrackType], null: true do
      description 'Find all Tracks by Project'
      argument :id, ID, required: true
    end
    def tracks_project(id:)
      Track.where('project_id = ?', id)
    end

    field :tracks_project_finished, [TrackType], null: true do
      description 'Find all finished tracks by project'
      argument :id, ID, required: true
    end
    def tracks_project_finished(id:)
      Track.where('project_id = ? AND status = TRUE', id)
    end

    field :tracks_project_not_finished, [TrackType], null: true do
      description 'Find all not finished tracks by project'
      argument :id, ID, required: true
    end
    def tracks_project_not_finished(id:)
      Track.where('project_id = ? AND status = FALSE', id)
    end

    field :members_team, [UserType], null: true do
      description 'Find all members by Team'
      argument :id, ID, required: true
    end
    def members_team(id:)
      Team.find(id).users
    end

    field :teams_user, [TeamType], null: true do
      description 'Find all teams by user'
      argument :id, ID, required: true
    end
    def teams_user(id:)
      User.find(id).teams
    end
  end
end

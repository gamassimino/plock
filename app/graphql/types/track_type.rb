module Types
  class TrackType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :starts_at, String, null: true
    field :ends_at, String, null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
    field :status, Boolean, null: true
    field :user, UserType, null: false
    field :project, ProjectType, null: false
  end
end

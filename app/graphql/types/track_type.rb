# frozen_string_literal: true

module Types
  # class TrackType
  #
  class TrackType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :starts_at, String, null: true
    field :ends_at, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :status, Boolean, null: false
    field :user, UserType, null: false
    field :project, ProjectType, null: false
  end
end

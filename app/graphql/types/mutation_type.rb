# frozen_string_literal: true

module Types
  # class MutationType
  #
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Login
    field :logout, mutation: Mutations::Logout
    field :interval_start, mutation: Mutations::IntervalStart
    field :interval_end, mutation: Mutations::IntervalEnd
  end
end
# frozen_string_literal: true

# class PlockSchema
#
class PlockSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end

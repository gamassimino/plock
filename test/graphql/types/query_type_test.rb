# frozen_string_literal: true

require 'test_helper'

module Types
  # class QueryTypeTest extend Types::QueryType
  #
  class QueryTypeTest < Types::QueryType
    # class QueryTypeTest extend ActiveSupport::TestCase
    #
    class QueryTypeTest < ActiveSupport::TestCase
      def setup
        @user = users(:matias)
        @user1 = users(:one)
        @team = teams(:one)
        @track = tracks(:one)
        @track1 = tracks(:two)
        @project = projects(:one)
        @project1 = projects(:two)
        @company = companies(:one)
      end

      test 'all project create by current user' do
        query_string = <<-GRAPHQL
          query{
            projects{
              name
              repository
              startAt
              user {
                name
                lastname
                email
              }
              team{
                name
                users{
                  name
                  lastname
                  email
                }
              }
              tracks{
                name
                startsAt
              }
              company{
                name
                description
              }
            }
          }
        GRAPHQL

        context = {
          current_user: @user,
        }
        result = PlockSchema.execute(
          query_string,
          variables: {},
          context: context 
        )
        project_one_name = result['data']['projects'][0]['name']
        project_one_tracks_one_name = result['data']['projects'][0]['tracks'][0]['name']
        project_one_team_name = result['data']['projects'][0]['team']['name']
        project_one_team_members_one_name = result['data']['projects'][0]['team']['users'][0]['name']

        assert_not_nil result
        assert_equal(@project.name, project_one_name)
        assert_equal(@track.name, project_one_tracks_one_name)
        assert_equal(@team.name, project_one_team_name)
        assert_equal(@user1.name, project_one_team_members_one_name)
      end

      # test 'all projects' do
      #   query_string = <<-GRAPHQL
      #     query{
      #       projects{
      #         id
      #         name
      #         repository
      #         startAt
      #         user {
      #           id
      #           name
      #           lastname
      #           email
      #         }
      #         team {
      #           id
      #           name
      #         }
      #         company {
      #           id
      #           name
      #           description
      #         }
      #       }
      #     }
      #   GRAPHQL
      #   result = PlockSchema.execute(
      #     query_string,
      #     variables: {},
      #     context: {}
      #   )
      #   project_result = result['data']['projects'][0]['name']

      #   assert_not_nil result
      #   assert_equal(@project.name, project_result)
      # end

      # test 'find tracks with a given user' do
      #   query_string = <<-GRAPHQL
      #     query{
      #       tracksUser{
      #         id
      #         name
      #         description
      #         startsAt
      #         endsAt
      #         status
      #         user {
      #           id
      #           name
      #           lastname
      #           email
      #         }
      #         project {
      #           id
      #           name
      #           repository
      #         }
      #       }
      #     }
      #   GRAPHQL

      #   result = PlockSchema.execute(
      #     query_string,
      #     variables: {},
      #     context: {}
      #   )
      #   tracks_result = result['data']['tracksUser'][0]['name']

      #   assert_not_nil result
      #   assert_equal(@track.name, tracks_result)
      # end

      # test 'find tracks with a given project' do
      #   query_string = <<-GRAPHQL
      #     query($id: ID!){
      #       tracksProject(id: $id){
      #         id
      #         name
      #         description
      #         startsAt
      #         endsAt
      #         status
      #         user {
      #           id
      #           name
      #           lastname
      #           email
      #         }
      #         project {
      #           id
      #           name
      #           repository
      #         }
      #       }
      #     }
      #   GRAPHQL

      #   project_id = @project1.id
      #   result = PlockSchema.execute(
      #     query_string,
      #     variables: { id: project_id },
      #     context: {}
      #   )
      #   tracks_result = result['data']['tracksProject'][0]['name']

      #   assert_not_nil result
      #   assert_equal(@track.name, tracks_result)
      # end

      # test 'find members for a team' do
      #   query_string = <<-GRAPHQL
      #     query($id: ID!){
      #       membersTeam(id: $id){
      #         name
      #         lastname
      #         email
      #       }
      #     }
      #   GRAPHQL

      #   team_id = @team.id
      #   result = PlockSchema.execute(
      #     query_string,
      #     variables: { id: team_id },
      #     context: {}
      #   )
      #   member_result = result['data']['membersTeam'][0]['name']

      #   assert_not_nil result
      #   assert_equal(@user1.name, member_result)
      # end
    end
  end
end

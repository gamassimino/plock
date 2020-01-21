# frozen_string_literal: true

require 'test_helper'

module Types
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

    test 'find project by id' do
      query_string = <<-GRAPHQL
        query($id: ID!){
          project(id: $id){
            id
            name
            repository
            startAt
            tracks {
              name
              status
            }
            user {
              id
              name
              lastname
              email
            }
            team {
              id
              name
            }
            company {
              id
              name
              description
            }
          }
        }
        GRAPHQL
      
      project_id = @project.id
      result = PlockSchema.execute(
        query_string,
        variables: { id: project_id },
        context: {}
      )
      project_name_result = result['data']['project']['name']
      project_track_name_result = result['data']['project']['tracks'][0]['name']

      assert_not_nil result
      assert_equal(@project.name, project_name_result)
      assert_equal(@track.name, project_track_name_result)
    end

    test 'all user data' do
      query_string = <<-GRAPHQL
        query{
          user{
            id
            name
            lastname
            email
            tracks{
              name
              status
            }
            projects{
              name
            }
            teams{
              name
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
      user_name_result = result['data']['user']['name']
      state_track_one = result['data']['user']['tracks'][0]['status']
      project_one_name = result['data']['user']['projects'][0]['name']

      assert_not_nil result
      assert_equal(@user.name, user_name_result)
      assert state_track_one
      assert_equal(@project.name, project_one_name)
    end
  end
end
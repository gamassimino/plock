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

      test 'find project' do
        query_string = <<-GRAPHQL
				query($id: ID!){
						project(id: $id){
							id
							name
							repository
							startAt
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
        project_result = result['data']['project']

        assert_not_nil result
        assert_equal(@project.name, project_result['name'])
      end

      test 'all projects' do
        query_string = <<-GRAPHQL
				query{
						projects{
							id
							name
							repository
							startAt
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
        result = PlockSchema.execute(
          query_string,
          variables: {},
          context: {}
        )
        project_result = result['data']['projects'][0]['name']

        assert_not_nil result
        assert_equal(@project.name, project_result)
      end

      test 'find projects with a given user' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					projectsUser(id: $id){
							id
							name
							repository
							startAt
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

        user_id = @user.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: user_id },
          context: {}
        )
        project_result = result['data']['projectsUser'][0]['name']

        assert_not_nil result
        assert_equal(@project.name, project_result)
      end

      test 'find projects with a given company' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					projectsCompany(id: $id){
							id
							name
							repository
							startAt
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

        company_id = @company.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: company_id },
          context: {}
        )
        project_result = result['data']['projectsCompany'][0]['name']

        assert_not_nil result
        assert_equal(@project.name, project_result)
      end

      test 'find projects with a given team' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					projectsTeam(id: $id){
							id
							name
							repository
							startAt
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

        team_id = @team.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: team_id },
          context: {}
        )
        project_result = result['data']['projectsTeam'][0]['name']

        assert_not_nil result
        assert_equal(@project.name, project_result)
      end

      test 'find tracks with a given user' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					tracksUser(id: $id){
						id
						name
						description
						startsAt
						endsAt
						status
						user {
							id
							name
							lastname
							email
						}
						project {
							id
							name
							repository
						}
					}
				}
        GRAPHQL

        user_id = @user1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: user_id },
          context: {}
        )
        tracks_result = result['data']['tracksUser'][0]['name']

        assert_not_nil result
        assert_equal(@track.name, tracks_result)
      end

      test 'find tracks with a given project' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					tracksProject(id: $id){
						id
						name
						description
						startsAt
						endsAt
						status
						user {
							id
							name
							lastname
							email
						}
						project {
							id
							name
							repository
						}
					}
				}
        GRAPHQL

        project_id = @project1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: project_id },
          context: {}
        )
        tracks_result = result['data']['tracksProject'][0]['name']

        assert_not_nil result
        assert_equal(@track.name, tracks_result)
      end

      test 'find tracks finished by a user' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					tracksUserFinished(id: $id){
						id
						name
						description
						startsAt
						endsAt
						status
						user {
							id
							name
							lastname
							email
						}
						project {
							id
							name
							repository
						}
					}
				}
        GRAPHQL

        user_id = @user1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: user_id },
          context: {}
        )
        tracks_result = result['data']['tracksUserFinished'][0]['name']

        assert_not_nil result
        assert_equal(@track.name, tracks_result)
      end

      test 'find tracks not finished by a user' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					tracksUserNotFinished(id: $id){
						id
						name
						description
						startsAt
						endsAt
						status
						user {
							id
							name
							lastname
							email
						}
						project {
							id
							name
							repository
						}
					}
				}
        GRAPHQL

        user_id = @user1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: user_id },
          context: {}
        )
        tracks_result = result['data']['tracksUserNotFinished'][0]['name']

        assert_not_nil result
        assert_equal(@track1.name, tracks_result)
      end

      test 'find tracks not finished by a project' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					tracksProjectNotFinished(id: $id){
						id
						name
						description
						startsAt
						endsAt
						status
						user {
							id
							name
							lastname
							email
						}
						project {
							id
							name
							repository
						}
					}
				}
        GRAPHQL

        project_id = @project1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: project_id },
          context: {}
        )
        tracks_result = result['data']['tracksProjectNotFinished'][0]['name']

        assert_not_nil result
        assert_equal(@track.name, tracks_result)
      end

      test 'find tracks finished by a project' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					tracksProjectFinished(id: $id){
						id
						name
						description
						startsAt
						endsAt
						status
						user {
							id
							name
							lastname
							email
						}
						project {
							id
							name
							repository
						}
					}
				}
        GRAPHQL

        project_id = @project1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: project_id },
          context: {}
        )
        tracks_result = result['data']['tracksProjectFinished'][0]['name']

        assert_not_nil result
        assert_equal(@track.name, tracks_result)
      end

      test 'find members for a team' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					membersTeam(id: $id){
						name
						lastname
						email
					}
				}
        GRAPHQL

        team_id = @team.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: team_id },
          context: {}
        )
        member_result = result['data']['membersTeam'][0]['name']

        assert_not_nil result
        assert_equal(@user1.name, member_result)
      end

      test 'find team for a user' do
        query_string = <<-GRAPHQL
				query($id: ID!){
					teamsUser(id: $id){
						name
					}
				}


        GRAPHQL

        user_id = @user1.id
        result = PlockSchema.execute(
          query_string,
          variables: { id: user_id },
          context: {}
        )
        team_result = result['data']['teamsUser'][0]['name']

        assert_not_nil result
        assert_equal(@team.name, team_result)
      end
    end
  end
end

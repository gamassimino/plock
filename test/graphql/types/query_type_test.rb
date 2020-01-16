require 'test_helper'

module Types
	class QueryTypeTest < Types::QueryType 
		test 'all project' do
			author = create(:one)
			non_author = create(:non_user)
			name_project = create(:project, name: true, author: author)

			query_string = <<-GRAPHQL
			query($id: ID!) {
				node(id: $id) {
					... on project {
						name
						repository
						user {
							name
						}
						team{
							name
						}
						company {
							name
						}
					}
				}
			}
			GRAPHQL

			project_id = PlockSchema.id_from_object(Project, Types::ProjectType, {})

			author_result = MySchema.execute(
				query_string,
				context: { viewer: author },
				variables: { id: post_id }
			)

			assert_equal "roberto", author_result["data"]["node"]["name"]
			non_author_result = MySchema.execute(query_string,
				context: { viewer: non_author },
				variables: { id: project_id }
			)
			assert_nil author_result["data"]["node"]
		end
	end
end
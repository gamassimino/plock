# frozen_string_literal: true

require 'elasticsearch/model'

# Team class
#
class Team < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :team_users
  has_many :users, through: :team_users, source: :user
  has_many :projects
  validates :name, presence: true, length: { minimum: 3 }

  def self.search(query)
    __elasticsearch__.search(
     {
      query: {
       multi_match: {
        query: query,
        fields: ['name']
       }
     }
    }
    )
   end

   settings do
    mappings dynamic: false do
      indexes :name, type: :text
    end
  end

end
Team.import(force: true)

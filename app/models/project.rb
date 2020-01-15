# frozen_string_literal: true

require 'elasticsearch/model'

# Project class
#
class Project < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :user
  belongs_to :company, optional: true
  belongs_to :team, optional: true
  has_many :tracks
  has_many :users, through: :team
  
  validates :name, :repository, :cost, :user_id, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    __elasticsearch__.search(
     {
      query: {
       multi_match: {
        query: query,
        fields: ['name', 'repository', 'cost', 'start_at', 'user_id', 'team_id']
       }
     }
    }
    )
   end

   settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :repository, type: :text, analyzer: :english
      indexes :cost, type: :text, analyzer: :english
      indexes :start_at, type: :text, analyzer: :english
    end
  end

end
Project.import(force: true)
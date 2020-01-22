# This class define the task model
require 'elasticsearch/model'

class Track < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks unless Rails.env.test?

  validates :name, :description, presence: true

  has_many :intervals
  belongs_to :project
  belongs_to :user

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, analyzer: 'english'
      indexes :description, analyzer: 'english'
      indexes :status, type: :boolean
      indexes :plock_time, type: :integer
      indexes :user_id, type: :integer
      indexes :project_id, type: :integer
    end
  end


  def as_indexed_json(options = nil)
     self.as_json( only: [ :name, :description, :project_id, :plock_time, :created_at ] )
  end


  # def self.search(query)
  #   __elasticsearch__.search({
  #     query: {
  #        filter: {
  #          query: query,
  #          fields: ['plock_time']
  #        }
  #      }
  #   })
  # end
end

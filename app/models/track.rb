# This class define the task model
require 'elasticsearch/model'

class Track < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :name, :description, presence: true
  belongs_to :project, dependent: :destroy
  belongs_to :user, dependent: :destroy

  def self.search(query)
    __elasticsearch__.search(
     {
      query: {
       multi_match: {
        query: query,
        fields: ['name', 'description', 'starts_at', 'ends_at', 'status', 'user_id', 'project_id']
       }
     }
    }
    )
   end

   settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :description, type: :text, analyzer: :english
      indexes :starts_at, type: :text, analyzer: :english
      indexes :ends_at, type: :text, analyzer: :english
      indexes :status, type: :text, analyzer: :english
      indexes :user_id, type: :text, analyzer: :english
      indexes :project_id, type: :text, analyzer: :english
    end
  end

end
Track.import(force: true)

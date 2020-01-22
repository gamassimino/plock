require 'elasticsearch/model'

class User < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks unless Rails.env.test?
  
  has_many :team_users
  has_many :tracks
  has_many :teams, through: :team_users
  has_many :projects #, through: :teams, source: :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, analyzer: 'english'
      indexes :lastname, analyzer: 'english'
      indexes :email, type: :date, analyzer: 'english'
      indexes :company_id, type: :integer
    end
  end
      
  def as_indexed_json(options = nil)
    self.as_json( only: [ :name, :lastname, :email, :company_id ] )
  end
      
  def self.search(query)
    __elasticsearch__.search({
      query: {
         multi_match: {
           query: query,
           fields: ['name^5', 'lastname', 'email', 'company_id']
         }
       },
    })
  end
end

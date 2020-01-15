require 'elasticsearch/model'

class User < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :team_users
  has_many :tracks
  has_many :teams, through: :team_users
  has_many :projects #, through: :teams, source: :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def self.search(query)
    __elasticsearch__.search(
     {
      query: {
       multi_match: {
        query: query,
        fields: ['name', 'lastname', 'email']
       }
     }
    }
    )
   end

   settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :lastname, type: :text, analyzer: :english
      indexes :email, type: :text, analyzer: :english
    end
  end       
end
User.import(force: true)

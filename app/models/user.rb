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
end

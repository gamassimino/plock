# frozen_string_literal: true

require 'elasticsearch/model'

# Team class
#
class Team < ApplicationRecord
 
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks unless Rails.env.test?
 
  has_many :team_users
  has_many :users, through: :team_users, source: :user
  has_many :projects
  validates :name, presence: true, length: { minimum: 3 }
end

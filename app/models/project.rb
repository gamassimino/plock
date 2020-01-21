# frozen_string_literal: true

require 'elasticsearch/model'

# Project class
#
class Project < ApplicationRecord
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks unless Rails.env.test?
  
  belongs_to :user
  belongs_to :company, optional: true
  belongs_to :team, optional: true
  has_many :tracks
  has_many :users, through: :team
  
  validates :name, :repository, :cost, :user_id, presence: true
  validates :name, uniqueness: true

end
 
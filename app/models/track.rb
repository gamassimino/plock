# This class define the task model
require 'elasticsearch/model'

class Track < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks unless Rails.env.test?
  
  validates :name, :description, presence: true
  has_many :intervals
  belongs_to :project, dependent: :destroy
  belongs_to :user, dependent: :destroy

end

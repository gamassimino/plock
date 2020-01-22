# frozen_string_literal: true

# Project class
#
class Project < ApplicationRecord
  
  belongs_to :user
  belongs_to :company, optional: true
  belongs_to :team, optional: true
  
  has_many :tracks, dependent: :destroy
  has_many :users, through: :team
  
  validates :name, :repository, :cost, :user_id, presence: true
  validates :name, uniqueness: true

end
 
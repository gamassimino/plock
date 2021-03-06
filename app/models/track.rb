# This class define the task model
class Track < ApplicationRecord
  has_many :intervals
  belongs_to :project, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, :description, presence: true
end

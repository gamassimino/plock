class Interval < ApplicationRecord
  belongs_to :track

  after_update :calculate_plock_time, if: -> { updated_at_previously_changed? }

  private
  def calculate_plock_time
    minutes = (updated_at - created_at) / 1.minute
    track.update_attribute(:plock_time, track.plock_time + minutes.to_i)
  end
end


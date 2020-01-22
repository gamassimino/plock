require 'test_helper'

class IntervalTest < ActiveSupport::TestCase
  setup do
    @track = tracks(:one)
  end

  test 'update plock time on update' do
    interval = Interval.create(track: @track)
    interval.update_attribute(:updated_at, 2.hours.from_now)
    assert_equal(@track.plock_time, 120)
  end

  test 'update plock time with the sum of each interval' do
    interval = Interval.create(track: @track)
    interval.update_attribute(:updated_at, 2.hours.from_now)
    interval = Interval.create(track: @track)
    interval.update_attribute(:updated_at, 1.hours.from_now)
    assert_equal(@track.plock_time, 180)
  end
end

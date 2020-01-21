require 'test_helper'

class UserTrackStatTest < ActiveSupport::TestCase

    setup do
        @track0 = tracks(:track_with_zero_time)
        @track1 = tracks(:track_with_10_hours)
        @track2 = tracks(:track_with_12_hours)
    end

    test "should give zero" do
        assert_equal(UserTrackStat.new(@track0).call, 0)
    end

    test "should give ten" do
        assert_equal(UserTrackStat.new(@track1).call, 600)    
    end
 
    test "should give twelve" do
        assert_equal(UserTrackStat.new(@track2).call, 720)    
    end

end

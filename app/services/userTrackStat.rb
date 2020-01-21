class UserTrackStat
    def initialize(track)
        @track = track
    end
  
    def call
        difference = ((@track.ends_at - @track.starts_at)).to_i
        (difference / 1.minute).to_i
    end
end    
                      
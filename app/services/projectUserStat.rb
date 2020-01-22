class ProjectUserStat
    def initialize(user)
        @user = user
    end
  
    def call
        count = 0
        @user.tracks.all.each do |track| 
            count = count + track.plock_time 
        end
        return count.to_i
    end
end    
             
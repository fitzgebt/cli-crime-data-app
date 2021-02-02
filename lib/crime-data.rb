class CrimeData
    # attr_accessors defined in initialize

    @@all = []          # all instances for every year of every state/offense combo sent to API

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_search?(state, offense)
        self.all.each do |instance|
            instance.location == state && instance.offense_type == offense ? true : false
        end
        end



    end


    def display_state_and_offense(state, offense)
    end

    # need to create methods for calling attributes of the instance?


end


# 
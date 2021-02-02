class CrimeData
    # attr_accessors defined in initialize

    @@all = []          # all instances for every year of every state/offense combo sent to API

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
        binding.pry
    end

    def self.all
        @@all
    end

    def self.new_search?(state, offense)
        self.all.each do |instance|
            if instance.include?(instance.state) && instance.include?(instance.offense)
                true # pull requested year from another method
            else
                Api.call_api(state, offense) # or maybe return false, and create the api instnace from CLI?
            end
        end



    end

    # need to create methods for calling attributes of the instance?


end


# 
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

    


end


# 
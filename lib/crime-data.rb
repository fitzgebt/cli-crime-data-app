class CrimeData

    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
            
        end
        @@all << self
    end

    


end



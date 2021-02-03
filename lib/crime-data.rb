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
        # binding.pry
        self.all.find do |instance|
            instance.location == state && instance.offense_type == offense
        end
    end

    def self.offense_by_year(state, offense, year)
        var =self.all.find do |instance|
            instance.location == state && instance.offense_type == offense && instance.data_year == year
        end
        binding.pry
    end

    def self.list_of_years(state, offense)
        array = []
        self.all.find do |instance|
            if instance.location == state && instance.offense_type == offense
                array << instance.data_year
            end
        end

    end


    

    # need to create methods for calling attributes of the instance?


end


# 
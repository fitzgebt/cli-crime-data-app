class Cli

    @state = ""
    @offense = ""

    def start
        puts "This app gathers information on crimes committed from the FBI's Uniform Crime Report (UCR)."
        puts "Information displayed will have occurred between 2006 and 2019."
        us_states_output
        puts "Please select a State from the above list:"
        self.gather_state
        offense_output
        puts "Please select an offense to view more information:"
        self.gather_offense(@state)
        # return readable list of requested state/offenses
        puts "Data for tis offense is available from 2006 - 2019."
        puts "For which year would you like to see data?"
        self.gather_year

        
        

    end

    def gather_state
        @state = gets.strip
    end

    def gather_offense(state)
        @offense = gets.strip
        # Api.call_api(@state, @offense)
    end

    def gather_year
        @year = gets.strip
        # CrimeData.offense_by_year(@year)
    end


    def offense_types
        offenses_list = ["aggravated-assault", "all-other-larceny", "all-other-offenses", "animal-cruelty", "arson", "assisting-or-promoting-prostitution", "bad-checks", "betting", "bribery", "burglary-breaking-and-entering", "counterfeiting-forgery", "credit-card-automated-teller-machine-fraud", "destruction-damage-vandalism-of-property", "driving-under-the-influence", "drug-equipment-violations", "drug-violations", "drunkenness", "embezzlement", "extortion-blackmail", "false-pretenses-swindle-confidence-game", "fondling", "gambling-equipment-violation", "hacking-computer-invasion", "human-trafficking-commerical-sex-acts", "human-trafficking-commerical-involuntary-servitude", "identity-theft", "impersonation", "incest", "intimidation", "justifiable-homicide", "kidnapping-abduction", "motor-vehicle-theft", "murder-and-nonnegligent-manslaughter", "negligent-manslaughter", "operating-promoting-assiting-gambling", "curfew-loitering-vagrancy-violations", "peeping-tom", "pocket-picking", "pornography-obscence-material", "prostitution", "purchasing-prostitution", "purse-snatching", "rape", "robbery", "sexual-assult-with-an-object", "sex-offenses-non-forcible", "shoplifting", "simple-assault", "sodomy", "sports-tampering", "statutory-rape", "stolen-property-offenses", "theft-from-building", "theft-from-coin-operated-machine-or-device", "theft-from-motor-vehicle", "theft-of-motor-vehicle-parts-or-accessories", "theft-from-motor-vehicle", "weapon-law-violation", "welfare-fraud", "wire-fraud", "not-specified", "liquor-law-violations", "crime-against-person", "crime-against-property", "crime-against-society", "assault-offenses", "homicide-offenses", "human-trafficking-offenses", "sex-offenses", "sex-offenses-non-forcible", " fraud-offenses", "larceny-theft-offenses", " drugs-narcotic-offenses", "gambling-offenses", "prostitution-offenses"]
    end

    def offense_output
        offense_types.each {|offense| puts offense}
    end
    
    def us_states_list
        states_list = ["Alabama", "AL", "Alaska", "AK", "Arizona", "AZ", "Arkansas", "AR", "California", "CA", "Colorado", "CO", "Connecticut", "CT", "Delaware", "DE", "Florida", "FL", "Georgia", "GA", "Hawaii", "HI", "Idaho", "ID", "Illinois", "IL", "Indiana", "IN", "Iowa", "IA", "Kansas", "KS", "Kentucky", "KY", "Louisiana", "LA", "Maine", "ME", "Maryland", "MD", "Massachusetts", "MA", "Michigan", "MI", "Minnesota", "MN", "Mississippi", "MS", "Missouri", "MO", "Montana", "MT", "Nebraska", "NE", "Nevada", "NV", "New Hampshire", "NH", "New Jersey", "NJ", "New Mexico", "NM", "New York", "NY", "North Carolina", "NC", "North Dakota", "ND", "Ohio", "OH", "Oklahoma", "OK", "Oregon", "OR", "Pennsylvania", "PA", "Rhode Island", "RI", "South Carolina", "SC", "South Dakota", "SD", "Tennessee", "TN", "Texas", "TX", "Utah", "UT", "Vermont", "VT", "Virginia", "VA", "Washington", "WA", "West Virginia", "WV", "Wisconsin", "WI", "Wyoming", "WY","al", "ak", "az", "ar", "ca", "co", "ct", "de", "fl", "ga", "hi", "id", "il", "in", "ia", "ks", "ky", "la", "me", "md", "ma", "mi", "mn", "ms", "mo", "mt", "ne", "nv", "nh", "nj", "nm", "ny", "nc", "nd", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "vt", "va", "wa", "wv", "wi", "wy"]
    end

    def us_states_output
        states_output = ["Alabama – AL", "Alaska - AK", "Arizona - AZ", "Arkansas - AR", "California - CA", "Colorado - CO", "Connecticut - CT", "Delaware - DE", "Florida - FL", "Georgia - GA", "Hawaii - HI", "Idaho - ID", "Illinois - IL", "Indiana - IN", "Iowa - IA", "Kansas - KS", "Kentucky - KY", "Louisiana - LA", "Maine - ME", "Maryland - MD", "Massachusetts - MA", "Michigan - MI", "Minnesota - MN", "Mississippi - MS", "Missouri - MO", "Montana - MT", "Nebraska - NE", "Nevada - NV", "New Hampshire - NH", "New Jersey - NJ", "New Mexico - NM", "New York - NY", "North Carolina - NC", "North Dakota - ND","Ohio - OH", "Oklahoma - OK", "Oregon - OR", "Pennsylvania - PA", "Rhode Island - RI", "South Carolina - SC", "South Dakota - SD", "Tennessee - TN", "Texas - TX", "Utah - UT", "Vermont - VT", "Virginia - VA", "Washington - WA", "West Virginia - WV", "Wisconsin - WI","Wyoming - WY"]
        states_output.each {|state| puts state}
    end



end



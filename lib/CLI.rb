class Cli

    @state = ""
    @offense = ""
    @year = ""

    def start
        puts "This app gathers information on crimes committed from the FBI's Uniform Crime Report (UCR)."
        puts "Information displayed will have occurred between 2006 and 2019."
        
        us_states_output           
        options         # this should loop through CLI instance so user can choose multiple times
    
    end

    def us_states_output
        states_output = ["Alabama – AL", "Alaska - AK", "Arizona - AZ", "Arkansas - AR", "California - CA", "Colorado - CO", "Connecticut - CT", "Delaware - DE", "Florida - FL", "Georgia - GA", "Hawaii - HI", "Idaho - ID", "Illinois - IL", "Indiana - IN", "Iowa - IA", "Kansas - KS", "Kentucky - KY", "Louisiana - LA", "Maine - ME", "Maryland - MD", "Massachusetts - MA", "Michigan - MI", "Minnesota - MN", "Mississippi - MS", "Missouri - MO", "Montana - MT", "Nebraska - NE", "Nevada - NV", "New Hampshire - NH", "New Jersey - NJ", "New Mexico - NM", "New York - NY", "North Carolina - NC", "North Dakota - ND","Ohio - OH", "Oklahoma - OK", "Oregon - OR", "Pennsylvania - PA", "Rhode Island - RI", "South Carolina - SC", "South Dakota - SD", "Tennessee - TN", "Texas - TX", "Utah - UT", "Vermont - VT", "Virginia - VA", "Washington - WA", "West Virginia - WV", "Wisconsin - WI","Wyoming - WY"]
        states_output.each {|state| puts state}
        puts "Please select a State from the above list:"
        gather_state  # gets here
    end

    def gather_state
        state = gets.strip
        if us_states_list(state)
            @state = state
            offense_output
        else
            us_states_output # add this loop to list method
        end
    end

    def us_states_list(state)
        states_list = ["Alabama", "AL", "Alaska", "AK", "Arizona", "AZ", "Arkansas", "AR", "California", "CA", "Colorado", "CO", "Connecticut", "CT", "Delaware", "DE", "Florida", "FL", "Georgia", "GA", "Hawaii", "HI", "Idaho", "ID", "Illinois", "IL", "Indiana", "IN", "Iowa", "IA", "Kansas", "KS", "Kentucky", "KY", "Louisiana", "LA", "Maine", "ME", "Maryland", "MD", "Massachusetts", "MA", "Michigan", "MI", "Minnesota", "MN", "Mississippi", "MS", "Missouri", "MO", "Montana", "MT", "Nebraska", "NE", "Nevada", "NV", "New Hampshire", "NH", "New Jersey", "NJ", "New Mexico", "NM", "New York", "NY", "North Carolina", "NC", "North Dakota", "ND", "Ohio", "OH", "Oklahoma", "OK", "Oregon", "OR", "Pennsylvania", "PA", "Rhode Island", "RI", "South Carolina", "SC", "South Dakota", "SD", "Tennessee", "TN", "Texas", "TX", "Utah", "UT", "Vermont", "VT", "Virginia", "VA", "Washington", "WA", "West Virginia", "WV", "Wisconsin", "WI", "Wyoming", "WY","al", "ak", "az", "ar", "ca", "co", "ct", "de", "fl", "ga", "hi", "id", "il", "in", "ia", "ks", "ky", "la", "me", "md", "ma", "mi", "mn", "ms", "mo", "mt", "ne", "nv", "nh", "nj", "nm", "ny", "nc", "nd", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "vt", "va", "wa", "wv", "wi", "wy"]
        states_list.include?(state)
    end

    def offense_output
        offense_types = ["aggravated-assault", "all-other-larceny", "all-other-offenses", "animal-cruelty", "arson", "assisting-or-promoting-prostitution", "bad-checks", "betting", "bribery", "burglary-breaking-and-entering", "counterfeiting-forgery", "credit-card-automated-teller-machine-fraud", "destruction-damage-vandalism-of-property", "driving-under-the-influence", "drug-equipment-violations", "drug-violations", "drunkenness", "embezzlement", "extortion-blackmail", "false-pretenses-swindle-confidence-game", "fondling", "gambling-equipment-violation", "hacking-computer-invasion", "human-trafficking-commerical-sex-acts", "human-trafficking-commerical-involuntary-servitude", "identity-theft", "impersonation", "incest", "intimidation", "justifiable-homicide", "kidnapping-abduction", "motor-vehicle-theft", "murder-and-nonnegligent-manslaughter", "negligent-manslaughter", "operating-promoting-assiting-gambling", "curfew-loitering-vagrancy-violations", "peeping-tom", "pocket-picking", "pornography-obscence-material", "prostitution", "purchasing-prostitution", "purse-snatching", "rape", "robbery", "sexual-assult-with-an-object", "sex-offenses-non-forcible", "shoplifting", "simple-assault", "sodomy", "sports-tampering", "statutory-rape", "stolen-property-offenses", "theft-from-building", "theft-from-coin-operated-machine-or-device", "theft-from-motor-vehicle", "theft-of-motor-vehicle-parts-or-accessories", "theft-from-motor-vehicle", "weapon-law-violation", "welfare-fraud", "wire-fraud", "not-specified", "liquor-law-violations", "crime-against-person", "crime-against-property", "crime-against-society", "assault-offenses", "homicide-offenses", "human-trafficking-offenses", "sex-offenses", "sex-offenses-non-forcible", " fraud-offenses", "larceny-theft-offenses", " drugs-narcotic-offenses", "gambling-offenses", "prostitution-offenses"]
        offense_types.each {|offense| puts offense}
        puts "Please select an offense (exactly as shown above) to view stats on this offense:"
        gather_offense   # gets here
    end

    def gather_offense
        offense = gets.strip
        if offense_list(offense)
            @offense = offense
            collect_years_of_instances(@state, @offense)           
        else
            offense_output
        end
    end

    def offense_list(offense)
        offense_types = ["aggravated-assault", "all-other-larceny", "all-other-offenses", "animal-cruelty", "arson", "assisting-or-promoting-prostitution", "bad-checks", "betting", "bribery", "burglary-breaking-and-entering", "counterfeiting-forgery", "credit-card-automated-teller-machine-fraud", "destruction-damage-vandalism-of-property", "driving-under-the-influence", "drug-equipment-violations", "drug-violations", "drunkenness", "embezzlement", "extortion-blackmail", "false-pretenses-swindle-confidence-game", "fondling", "gambling-equipment-violation", "hacking-computer-invasion", "human-trafficking-commerical-sex-acts", "human-trafficking-commerical-involuntary-servitude", "identity-theft", "impersonation", "incest", "intimidation", "justifiable-homicide", "kidnapping-abduction", "motor-vehicle-theft", "murder-and-nonnegligent-manslaughter", "negligent-manslaughter", "operating-promoting-assiting-gambling", "curfew-loitering-vagrancy-violations", "peeping-tom", "pocket-picking", "pornography-obscence-material", "prostitution", "purchasing-prostitution", "purse-snatching", "rape", "robbery", "sexual-assult-with-an-object", "sex-offenses-non-forcible", "shoplifting", "simple-assault", "sodomy", "sports-tampering", "statutory-rape", "stolen-property-offenses", "theft-from-building", "theft-from-coin-operated-machine-or-device", "theft-from-motor-vehicle", "theft-of-motor-vehicle-parts-or-accessories", "theft-from-motor-vehicle", "weapon-law-violation", "welfare-fraud", "wire-fraud", "not-specified", "liquor-law-violations", "crime-against-person", "crime-against-property", "crime-against-society", "assault-offenses", "homicide-offenses", "human-trafficking-offenses", "sex-offenses", "sex-offenses-non-forcible", " fraud-offenses", "larceny-theft-offenses", " drugs-narcotic-offenses", "gambling-offenses", "prostitution-offenses"]
        offense_types.include?(offense)
    end


    def collect_years_of_instances(@state, @offense)
        array = []
        if CrimeData.new_search?(@state, @offense) == true
            array = CrimeData.list_of_years(@state, @offense)
            first = array.first
            last = array.last
            gather_year(first, last)
        else
            Api.call_api(@state, @offense)
            array = CrimeData.list_of_years(@state, @offense)
            first = array.first
            last = array.last
            gather_year(first, last)
        end
    end

    def gather_year(first, last)
        # add dynamic years for years printed below utilizing CrimeData.new_search? method
        puts "Data for this offense is available from #{first.to_i} - #{last.to_i}."
        puts "For which year would you like to see data?"
        year = gets.strip
        if year.to_i.between?(first.to_i, last.to_i)
            @year = year.to_i
            instance = CrimeData.offense_by_year(@state, @offense, @year)
            display_basic_info(instance)
            yes_or_no(instance)
        else
            gather_year(first, last)
        end
    end

    def options(instance)
        puts "Would you like to see another State, Offense, or Year?" 
        puts "Type 'exit' to end the program at any time"
        input = gets.strip
        if input == "State" || input == "state" || input == "s" || input == "STATE" || input == "S"
            gather_state
        elsif input == "Offense" || input == "offense" || input == "o" || input == "OFFENSE" || input == "O"
            gather_offense
        elsif input == "victim" || input == "victims" || input == "v" || input == "V" || input == "VICTIM" || input == "info"
            victim_demographics(instance)
        elsif input == "Year" || input == "year" || input == "y" || input == "YEAR" || input == "y" || is_integer?(input) == true
            if is_integer?(input) == true && input.to_i.between?(2006,2019)
                @year = input
                # CrimeData.offense_by_year(@year)
            else 
                gather_year
            end
        elsif   input == "exit" || input == "Exit" || input == "EXIT"
            abort("Thank you.")
        else
            "Please enter 'state', 'offense', 'year' or 'victims':"
            options(instance)
        end
        
    end

    def is_integer?(input)
        input.length == 4 ? input.to_i.to_s == input : false
    end

    def display_basic_info(instance)
        binding.pry
        puts "State: #{instance.location}"
        puts "Offense: #{instance.offense_type}"
        puts "Occurances: #{instance.offense_count}"
        puts "Year: #{instance.data_year}"
    end

    def yes_or_no(instance)
        puts "Would you like to view statistics related to victim demographics?"
        input = gets.strip
        if input == "yes" || input == "y" || input == "Yes" || input == "Y" || input == "YES"
            victim_demographics(instance)
        elsif 
            input == "no" || input == "n" || input == "No" || input == "N" || input == "NO"
            options(instance)
        elsif   input == "exit" || input == "Exit" || input == "EXIT"
            abort("Thank you.")
        else
            "Please enter 'yes' or 'no'"
            yes_or_no(instance)
        end
    end

    def victim_demographics(instance)
        puts "Victim demographics are broken up into categories." 
        puts "1. Age"
        puts "2. Race"
        puts "3. Ethnicity"
        puts "4. Sex"
        puts "5. All Demographics"
        puts "Choose a category from the list above:"
        input = gets.strip
        # instance_array = [instance.location, instance.data_year, instance.offense_type, instance.offenses_count]
        if input == "1" || input == "A" || input == "a" || input == "Age" || input == "age" 
            victim_age_range(instance)
        elsif input == "2" || input == "R" || input == "r" || input == "Race" || input == "race"
            victim_race(instance)
        elsif input == "3" || input == "E" || input == "e" || input == "Ethnicity" || input == "ethnicity"
            victim_ethnicity(instance)
        elsif input == "4" || input == "sex" || input == "s" || input == "S" || input == "SEX"
            victim_sex(instance)
        elsif input == "5" || input == "all" || input == "All" || input == "All"
            all_stats(instance)
        elsif   input == "exit" || input == "Exit" || input == "EXIT"
            abort("Thank you.")
        end
    end

    def victim_age_range(instance)
        display_basic_info(instance)
        puts "Victim Age: 0-9yrs: #{instance.age_0_9}, 10-19yrs: #{instance.age_10_19}"
        puts "Victim Age: 20-29yrs: #{instance.age_20_29}, 30-39yrs: #{instance.age_30_39}"
        puts "Victim Age: 40-49yrs: #{instance.age_40_49}, 50-59yrs: #{instance.age_50_59}"
        puts "Victim Age: 60-69yrs: #{instance.age_60_69}, 70-79yrs: #{instance.age_70_79}"
        puts "Victim Age: 80-89yrs: #{instance.age_80_89}, 90-99yrs: #{instance.age_90_99}"
        yes_or_no(instance)
    end

    def victim_race(instance)
        display_basic_info(instance)
        puts "Asian: #{instance.asian}, Native Hawaiian: #{instance.native_hawaiian}, Black: #{instance.black}, White: #{instance.white}"
        puts "American Indian: #{instance.american_indian}, Unknown Race: #{instance.unknown_race}"
        yes_or_no(instance)
    end

    def victim_ethnicity(instance)
        display_basic_info(instance)
        puts "Victim Ethnicity: Hispanic: #{instance.hispanic}, Non-Hispanic: #{instance.not_hispanic}"
        yes_or_no(instance)
    end

    def victim_sex(instance)
        display_basic_info(instance)
        puts "Victim Sex: Female: #{instance.female}, Male: #{instance.male}"
        yes_or_no(instance)
    end

    def all_stats(instance)
        display_basic_info(instance)
        victim_age_range(instance)
        victim_race(instance)
        victim_ethnicity(instance)
        victim_sex(instance)
        yes_or_no(instance)
        end
end





# create methods related to specified victim_demographics on instance
# find way to return all attributed the user has searched for related to the current instance
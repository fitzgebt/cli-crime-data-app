require 'pry'

class Api

    
    @@api_key = "UtGzNmGS5GyUAcLL4RsPvczS85nKlg9RcvOASqg3"
    # @@offenses_count = "https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/{<offense>}/offense/states/{<state>}/COUNT?API_KEY=#{@@api_key}"
    # @@victim_demographics = "https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/wa#{state}/#{demographic}?API_KEY=#{@@api_key}"



    def self.call_api(state, offense)
        offense_count = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/offense/states/#{state}/COUNT?API_KEY=#{@@api_key}")
        offense_count_hash = offense_count["results"].collect do |hash|
            var = {offense_count: hash["offense_count"], data_year: hash["data_year"]}
        end
        
        victim_age = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/#{state}/age?API_KEY=#{@@api_key}")
        victim_age_hash = victim_age["results"].collect do |hash|
            var = {unknown_age: hash["unknown"], age_0_9: hash["range_0_9"], age_10_19: hash["range_10_19"], age_20_29: hash["range_20_29"], age_30_39: hash["range_30_39"], age_40_49: hash["range_40_49"], age_50_59: hash["range_50_59"], age_60_69: hash["range_60_69"], age_70_79: hash["range_70_79"], age_80_89: hash["range_80_89"], age_90_99: hash["range_90_99"]}
        end

        victim_race = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/#{state}/race?API_KEY=#{@@api_key}")
        victim_race_hash = victim_race["results"].collect do |hash|
            var = {asian: hash["asian"], native_hawaiian: hash["native_hawaiian"], black: hash["black"], american_indian: hash["american_indian"], unknown_race: hash["unknown"], white: hash["white"]}
        end

        victim_ethnicity = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/#{state}/ethnicity?API_KEY=#{@@api_key}")
        victim_ethnicity_hash = victim_ethnicity["results"].collect do |hash|
            var = {hispanic: hash["hispanic"], not_hispanic: hash["not_hispanic"]}
        end

        victim_sex = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/#{state}/sex?API_KEY=#{@@api_key}")
        victim_sex_hash = victim_sex["results"].collect do |hash|
            var = {male: hash["male_count"], female: hash["female_count"]}
        end

        
            binding.pry
        
        CrimeData.new(hash)
    end

end

# victim age attributs {"results"=> [{"unknown"=>0, "range_0_9"=>0, "range_10_19"=>30, "range_20_29"=>96, "range_30_39"=>14, "range_40_49"=>25, "range_50_59"=>16, "range_60_69"=>5, "range_70_79"=>7, "range_80_89"=>4, "range_90_99"=>0, "data_year"=>2006}, ... ]
# race atributes {"results"=> [{"asian"=>6, "native_hawaiian"=>0, "black"=>6, "american_indian"=>0, "unknown"=>41, "white"=>144, "data_year"=>2006},  ... ]
# ethnicity {"results"=> [{"hispanic"=>4, "multiple"=>0, "not_hispanic"=>130, "unknown"=>41, "data_year"=>2006}, ... ]
# sex {"results"=> [{"male_count"=>115, "female_count"=>82, "unknown"=>0, "data_year"=>2006}, ... ]
# Offenses to input:aggravated-assault,all-other-larceny,all-other-offenses,animal-cruelty,arson,assisting-or-promoting-prostitution,bad-checks,betting,bribery,burglary-breaking-and-entering,counterfeiting-forgery,credit-card-automated-teller-machine-fraud,destruction-damage-vandalism-of-property,driving-under-the-influence,drug-equipment-violations,drug-violations,drunkenness,embezzlement,extortion-blackmail,false-pretenses-swindle-confidence-game,fondling,gambling-equipment-violation,hacking-computer-invasion,human-trafficking-commerical-sex-acts,human-trafficking-commerical-involuntary-servitude,identity-theft,impersonation,incest,intimidation,justifiable-homicide,kidnapping-abduction,motor-vehicle-theft,murder-and-nonnegligent-manslaughter,negligent-manslaughter,operating-promoting-assiting-gambling,curfew-loitering-vagrancy-violations,peeping-tom,pocket-picking,pornography-obscence-material,prostitution,purchasing-prostitution,purse-snatching,rape,robbery,sexual-assult-with-an-object,sex-offenses-non-forcible,shoplifting,simple-assault,sodomy,sports-tampering,statutory-rape,stolen-property-offenses,theft-from-building,theft-from-coin-operated-machine-or-device,theft-from-motor-vehicle,theft-of-motor-vehicle-parts-or-accessories,theft-from-motor-vehicle,weapon-law-violation,welfare-fraud,wire-fraud,not-specified,liquor-law-violations,crime-against-person,crime-against-property,crime-against-society,assault-offenses,homicide-offenses,human-trafficking-offenses,sex-offenses,sex-offenses-non-forcible, fraud-offenses,larceny-theft-offenses, drugs-narcotic-offenses,gambling-offenses,prostitution-offenses,all-offenses
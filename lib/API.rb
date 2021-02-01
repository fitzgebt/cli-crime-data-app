require 'pry'

class Api

    
    @@api_key = "UtGzNmGS5GyUAcLL4RsPvczS85nKlg9RcvOASqg3"
    # @@offenses_count = "https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/{<offense>}/offense/states/{<state>}/COUNT?API_KEY=#{@@api_key}"
    # @@victim_demographics = "https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/wa#{state}/#{demographic}?API_KEY=#{@@api_key}"



    def self.call_api(state, offense, demographic = "age")
        offenses_count = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/offense/states/#{state}/COUNT?API_KEY=#{@@api_key}")
        victim_demographics = HTTParty.get("https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/#{offense}/victim/states/#{state}/#{demographic}?API_KEY=#{@@api_key}")
        binding.pry
        hash = {}
        CrimeData.new(hash)
    end

    


end
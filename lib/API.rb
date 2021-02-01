require 'pry'

class Api

    
    @@api_key = "UtGzNmGS5GyUAcLL4RsPvczS85nKlg9RcvOASqg3"

    @@state = ""
    @@offense = ""
    
    @@url = "https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/motor-vehicle-theft/offense/states/wa/COUNT?API_KEY=#{@@api_key}"




    def self.call_api
        response = HTTParty.get(@@url)
    end

    


end
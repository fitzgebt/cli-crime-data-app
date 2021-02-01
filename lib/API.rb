require 'pry'

class Api

    
    @@api_key = "UtGzNmGS5GyUAcLL4RsPvczS85nKlg9RcvOASqg3"

    
    
    @@url = "https://api.usa.gov/crime/fbi/sapi/api/data/nibrs/motor-vehicle-theft/offense/states/wa/COUNT?API_KEY=#{@@api_key}"




    def self.test_get
        response = HTTParty.get(@@url)
        binding.pry
    end

    self.test_get
    


end
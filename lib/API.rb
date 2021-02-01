require 'pry'

class Api

    
    @@api_key = "UtGzNmGS5GyUAcLL4RsPvczS85nKlg9RcvOASqg3"

    @@url = "https://api.usa.gov/crime/fbi/sapi/api/participation/national?api_key=#{@@api_key}"
    @@url2 = "https://api.usa.gov/crime/fbi/sapi/api/summarized/agencies/wa/offenses/2019/2020?API_KEY=@@api_key"



    def self.test_get
        url = "https://api.usa.gov/crime/fbi/sapi/api/participation/national?api_key=#{@@api_key}"
        response = HTTParty.get(@@url)
        binding.pry
    end

    self.test_get
    


end
require 'httparty'

def get_mock_json(filename)
  file = File.read(filename)
  data_hash = JSON.parse(file)

end 

def search_places(place)
  keyword = place.split(' ').join('+')
  url_text = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{keyword}+point+of+interest&language=en&key=#{ENV['GOOGLE_API_KEY']}"
  # search_result = HTTParty.get(url_text).parsed_response 
  
  search_result = get_mock_json('mock_up/search_result.json')
  
  search_result
end 

# binding.pry
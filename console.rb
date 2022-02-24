require 'pry'
require 'json'

def get_mock_json(filename)
  file = File.read(filename)
  data_hash = JSON.parse(file)
end 

search_result = get_mock_json('mock_up/search_result.json')

binding.pry
require 'httparty'

def get_mock_json(filename)
  file = File.read(filename)
  data_hash = JSON.parse(file)
end 

def search_places(place)
  keyword = place.split(' ').join('+')
  url_text = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{keyword}+point+of+interest&language=en&key=#{ENV['GOOGLE_API_KEY']}"
  search_result = HTTParty.get(url_text).parsed_response 
  
  # search_result = get_mock_json('mock_up/search_result.json')
  
  search_result
end 

def get_places_from_trip_id(trip_id)
  results = run_sql("SELECT * FROM places WHERE trip_id = $1;",[trip_id])
  results
end

def add_places_to_trip(trip_id,places_arr)
  places_arr.each do |place|
    run_sql("INSERT
      INTO places(place_name, google_place_id, latitudes, longitudes,formatted_address, rating, user_ratings_total, photo_reference, trip_id)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);",
      [
        place["place_name"],
        place["google_place_id"],
        place["latitudes"],
        place["longitudes"],
        place["formatted_address"],
        place["rating"],
        place["user_ratings_total"],
        place["photo_reference"],
        trip_id
      ])
  end
end 

def delete_place_from_place_id(places_id)
  run_sql("DELETE FROM places WHERE id=$1",[places_id])
end 

def delete_place_from_trip_id(trip_id)
  run_sql("DELETE FROM places WHERE trip_id=$1",[trip_id])
end 
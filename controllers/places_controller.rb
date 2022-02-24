get '/:id/places' do 
  redirect '/' unless signed_in?
  trip_id = params['id']
  
  erb :'/places/places', locals:{
    trip_id: trip_id,
    search_result: nil
  }
  
end 

get '/:id/search' do 
  redirect '/' unless signed_in?

  trip_id = params['id']
  keyword_search = params['keyword_search'] || ""
  result = search_places(keyword_search)
  

  erb :'/places/places', locals:{
    trip_id: trip_id,
    search_result: (result["status"] == 'OK')? result['results'] : []
  }

end 

post '/:id/places' do
  trip_id = params['id'].to_i
  places_info_arr = JSON.parse(params['places_info'])
  unless places_info_arr.empty? 
    add_places_to_trip(trip_id,places_info_arr)
  end
  redirect "/trips/#{trip_id}/detail"
end

delete '/:id/delete' do
  trip_id = params['id'].to_i
  places_id = params['place_id'].to_i
  delete_place_from_place_id(places_id)
  
  redirect "/trips/#{trip_id}/detail"
end
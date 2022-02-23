get '/:id/places' do 
  trip_id = params['id']
  
  erb :'/places/places', locals:{
    trip_id: trip_id,
    search_result: nil
  }
end 

get '/search' do 
  trip_id = params['trip_id']
  keyword_search = params['keyword_search'] || ""
  result = search_places(keyword_search)
  

  erb :'/places/places', locals:{
    trip_id: trip_id,
    search_result: (result["status"] == 'OK')? result['results'] : []
  }

end 
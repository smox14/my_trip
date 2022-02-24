get '/trips' do 
  redirect '/' unless signed_in?
  userid = session['user_id']
  upcomming_trips = get_upcomming_trips_from_userid(userid)
  past_trips = get_past_trips_from_userid(userid)
  erb :'trips/all-trips', locals:{
    upcomming_trips: upcomming_trips,
    past_trips: past_trips
  }
end 

get '/trips/new' do
  redirect '/' unless signed_in?
  erb :'trips/new'
end

post '/trips' do
  redirect '/' unless signed_in?

  trip_name = params['trip_name'].upcase
  from_date = params['from_date']
  to_date = params['to_date']
  image_url = params['image_url']
  user_id = params['user_id'].to_i
  create_new_trip(trip_name,from_date,to_date,image_url,user_id)
  
  redirect '/trips'
end

get '/trips/:id/edit' do
  redirect '/' unless signed_in?

  trip_id = params['id']
  result = get_trip(trip_id)[0]
  
  erb :'trips/edit', locals:{
    trip_info: result
  }
end

put '/trips/:id' do
  trip_id = params['id'].to_i
  trip_name = params['name'].upcase
  from_date = params['from_date']
  to_date = params['to_date']
  image_url = params['image_url']
  update_trip(trip_name, from_date, to_date, image_url, trip_id)

  redirect '/trips'  
end

delete '/trips/:id' do
  trip_id = params['id'].to_i
  p trip_id
  delete_trip(trip_id)
  redirect '/trips' 
end

get '/trips/:id/detail' do
  redirect '/' unless signed_in?
  
  trip_id = params['id'].to_i
  trip_info = get_trip(trip_id)[0]
  places = get_places_from_trip_id(trip_id)
  # p places
  # binding.pry
  erb :'trips/detail', locals:{
    trip_info: trip_info,
    places: places
  }
end
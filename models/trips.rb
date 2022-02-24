def get_upcomming_trips_from_userid(userid)
  result = run_sql("SELECT * 
    FROM trips 
    WHERE user_id = $1 and to_date >= CURRENT_DATE 
    ORDER BY from_date;",
    [userid])
end

def get_past_trips_from_userid(userid)
  result = run_sql("SELECT * 
    FROM trips 
    WHERE user_id = $1 and to_date < CURRENT_DATE 
    ORDER BY to_date DESC;",
    [userid])
end

def create_new_trip(trip_name,from_date,to_date,image_url,user_id)
  run_sql("INSERT 
    INTO trips(trip_name, from_date, to_date,image_url,user_id) 
    VALUES ($1, $2, $3, $4,$5);",
    [trip_name,from_date,to_date,image_url,user_id])
end 

def get_trip(trip_id)
  run_sql("SELECT * FROM trips WHERE id = $1;",[trip_id])
end

def update_trip(trip_name, from_date, to_date, image_url, trip_id)
  run_sql("UPDATE trips
    SET trip_name = $1, from_date = $2, to_date = $3, image_url = $4
    WHERE id = $5;",[trip_name, from_date, to_date, image_url, trip_id])
end 

def delete_trip(trip_id)
  run_sql("DELETE FROM trips WHERE id = $1;", [trip_id])
end  
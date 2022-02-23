get '/sign-up' do
  erb :'users/new'
end

# create new user
post '/users' do 
  username = params['username']
  email = params['email']
  password = params['password']
  
  create_user(username,email,password)

  redirect '/'
end 
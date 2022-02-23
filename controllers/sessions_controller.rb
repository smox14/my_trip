get '/sign-in' do
  erb :'sessions/new'  
end

# create session after signin
post '/sessions' do 
  email = params['email']  
  password = params['password']
  
  user = find_user_by_email(email)

  #  Using  BCrypt to check that the user provided the correct password
  if user && BCrypt::Password.new(user['password_digest']) == password
    session['user_id'] = user['id']    
    redirect '/'
  else
    "Sign in failed."
  end
  
end 

delete '/sessions' do
  session['user_id'] = nil
  redirect '/'
end
def create_user(username,email,password)
  password_digest = BCrypt::Password.create(password)

  run_sql("INSERT INTO users(username, email, password_digest) VALUES ($1, $2, $3)", [username, email, password_digest])  
end

def find_user_by_email(email)
  users = run_sql("SELECT * FROM users WHERE email = $1",[email])
  
  if users.to_a.empty?
    nil 
  else 
    users[0]
  end
end

def find_user_by_id(id)
  run_sql("SELECT * FROM users WHERE id = $1",[id])[0]
end
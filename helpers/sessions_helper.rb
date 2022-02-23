#  Ruby convention: method with a question mark at the end always return a boolean value.
def signed_in?
  # return true / false
  !!session['user_id']
end

def current_user 
  if signed_in?
    find_user_by_id(session['user_id'])
  else 
    nil 
  end
end
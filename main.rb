require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'json' if development?
require 'bcrypt'  

# this make the session hash work
enable :sessions
require_relative 'db/db'

get '/' do
  erb :index
end
   
require_relative 'models/user'
require_relative 'models/places'
require_relative 'models/trips'

require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/trips_controller'
require_relative 'controllers/places_controller'

require_relative 'helpers/sessions_helper'   
  

  
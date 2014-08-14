require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/ingredient.rb"
require_relative "./models/category.rb"
require_relative "./models/user.rb"
require_relative "./models/recipe.rb"
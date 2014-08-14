ENV['RACK_ENV'] = 'test'

require "sinatra/activerecord"

require "sqlite3"

require_relative "../models/ingredient.rb"
require_relative "../models/category.rb"
require_relative "../models/user.rb"
require_relative "../models/recipe.rb"

RSpec.configure do |config|
  Ingredient.delete_all
  User.delete_all
  Category.delete_all
  Recipe.delete_all
end


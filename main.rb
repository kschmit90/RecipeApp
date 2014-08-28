# Index, show, new, create, edit, update, delete

require 'rubygems'
require 'bundler'

Bundler.require

require_relative './models/ingredient.rb'
require_relative './models/category.rb'
require_relative './models/user.rb'
require_relative './models/recipe.rb'

require_relative './routes/categories.rb'
require_relative './routes/ingredients.rb'
require_relative './routes/recipes.rb'
require_relative './routes/users.rb'

get '/' do
  @categories = Category.all
  @names = User.all

  erb :home
end

get '/recipe_search' do
  @names = User.all
  @n = params['search']
  @recipes = Recipe.where("name LIKE '%#{@n}%'")

  erb :search
end

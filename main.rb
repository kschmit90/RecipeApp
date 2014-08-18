require 'pry'

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require 'sqlite3'

require_relative './models/ingredient.rb'
require_relative './models/category.rb'
require_relative './models/user.rb'
require_relative './models/recipe.rb'

get '/' do
  @categories = Category.all
  @names = User.all

  erb :home
end

get '/create_user' do

  erb :create_user
end

post '/save_user' do
  @new_user = User.create(name: params['name'])

  if @new_user.errors.any?
    @name_message = 'That name is taken. PLEASE TRY AGAIN.'
  else
    @name_message = @new_user.name
  end

  @names = User.all

  erb :create_recipe
end

get '/create_recipe' do
  @names = User.all

  erb :create_recipe
end

post '/save_recipe' do
  id = params['namelist']
  r = params['frecipe']
  i = params['finstructions']
  c = params['categorylist']

  @recipe = Recipe.create(name: r, instructions: i, category_id: c, user_id: id)

  params.each do |k, v|
    if k.length < 3 && v.length > 1
      new_ing = Ingredient.create(ingredient: v)
      @recipe.ingredients << new_ing unless @recipe.ingredients.include? new_ing
    end
  end

  erb :new_recipe_page
end

get '/user_recipes' do
  u_id = params['id']
  @user = User.find(u_id)

  erb :user_recipes
end

get '/recipe_search' do
  @n = params['search']
  @recipes = Recipe.where("name LIKE '%#{@n}%'")

  erb :search
end

get '/recipe_page/:id' do
  r_id = params['id']
  @recipe = Recipe.find(r_id)

  erb :recipe_page
end

get '/recipes_by_category' do
  c_id = params['category']
  @category = Category.find(c_id)

  erb :category_search
end

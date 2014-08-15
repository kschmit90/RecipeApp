require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/ingredient.rb"
require_relative "./models/category.rb"
require_relative "./models/user.rb"
require_relative "./models/recipe.rb"


get "/" do
  
  
  erb :home
end

get "/create_user" do
    
    
  erb :create_user
end

post "/save_user" do
  new_user = User.create({name: params["name"]})
  if new_user.errors.any?
    new_user.errors.full_messages.each do |message|
      @name_message = "That name is taken. PLEASE TRY AGAIN."
    end
  else
    @name_message = new_user.name
  end
  
  erb :new_user
end

get "/create_recipe" do
  erb :create_recipe
end

post "/save_recipe" do
  name = params["fname"]
  recipe = params["frecipe"]
  instructions = params["finstructions"]
  c = params["categorylist"]
  
  if User.find_by_name(name) == nil
    @new_recipe = Recipe.create({name: recipe, instructions: instructions, category_id: c, user_id: 1})
  else
    name_id = User.find_by_name(name).id  
    @new_recipe = Recipe.create({name: recipe, instructions: instructions, category_id: c, user_id: name_id})
  end
  
  params.each do |k, v|
    if k.length < 3 && v.length > 1
      new_ing = Ingredient.create({ingredient: v})
      @new_recipe.ingredients << new_ing unless @new_recipe.ingredients.include? new_ing
    end
  end
  
  erb :new_recipe_page
end
  
get "/your_recipes" do
  name = params["name"]
  if User.find_by_name(name) == nil
    @user = User.find(1)
  else
    @user = User.find_by_name(name)
  end
  erb :your_recipes
end

get "/recipe_search" do
  n = params["search"]
  @recipes = Recipe.where("name LIKE '%#{n}%'")
  erb :search
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
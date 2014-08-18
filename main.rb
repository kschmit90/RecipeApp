require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"

require_relative "./models/ingredient.rb"
require_relative "./models/category.rb"
require_relative "./models/user.rb"
require_relative "./models/recipe.rb"

binding.pry

get "/" do
  @names = User.all
  
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
  @names = User.all
  erb :create_recipe
end

post "/save_recipe" do
  u_id = params["namelist"]
  recipe = params["frecipe"]
  instructions = params["finstructions"]
  c = params["categorylist"]

  @new_recipe = Recipe.create({name: recipe, instructions: instructions, category_id: c, user_id: u_id})
  
  params.each do |k, v|
    if k.length < 3 && v.length > 1
      new_ing = Ingredient.create({ingredient: v})
      @new_recipe.ingredients << new_ing unless @new_recipe.ingredients.include? new_ing
    end
  end
  
  erb :new_recipe_page
end
  
get "/user_recipes" do
  u_id = params["id"]
  @user = User.find(u_id)
  binding.pry
  erb :user_recipes
end

get "/recipe_search" do
  n = params["search"]
  @recipes = Recipe.where("name LIKE '%#{n}%'")
  erb :search
end
  
get "/recipe_page/:id" do
  r_id = params["id"]
  @recipe = Recipe.find(r_id)
  binding.pry
  erb :recipe_page
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
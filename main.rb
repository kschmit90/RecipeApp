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
  
  
  erb :home
end

get "/create_user" do
    
    
  erb :create_user
end

post "/save_user" do
  new_user = User.create({name: params["name"]})
  if new_user.errors.any?
    new_user.errors.full_messages.each do |message|
      @message = "Name is taken. PLEASE TRY AGAIN."
    end
  else
    @message = new_user.name
  end
  
  erb :new_user
end

get "/create_recipe" do
  erb :create_recipe
end

post "/save_recipe" do
  name_id = User.find_by_name(params["name"]).id
  recipe = params["recipe"]
  instructions = params["instructions"]
  c = params["categorylist"]
  binding.pry
  case c
  when "cakes"
    c = 1
  when "pies"
    c = 2
  when "casseroles"
    c = 3
  when "pizza"
    c = 4
  when "dessert"
    c = 5
  when "dinner"
    c = 6
  when "healthy"
    c = 7
  when "comfort"
    c = 8
  when "breakfast"
    c = 9
  when "lunch"
    c = 10
  when "other"
    c = 11
  when "beverages"
    c = 12
  else
    c = nil
  end
  
  i1 = Ingredient.create({ingredient: params["ingredient1"]})
  i2 = Ingredient.create({ingredient: params["ingredient2"]})
  i3 = Ingredient.create({ingredient: params["ingredient3"]})
  i4 = Ingredient.create({ingredient: params["ingredient4"]})
  i5 = Ingredient.create({ingredient: params["ingredient5"]})
  i6 = Ingredient.create({ingredient: params["ingredient6"]})
  i7 = Ingredient.create({ingredient: params["ingredient7"]})
  i8 = Ingredient.create({ingredient: params["ingredient8"]})
  i9 = Ingredient.create({ingredient: params["ingredient9"]})
  i10 = Ingredient.create({ingredient: params["ingredient10"]})
  i11 = Ingredient.create({ingredient: params["ingredient11"]})
  i12 = Ingredient.create({ingredient: params["ingredient12"]})
  i13 = Ingredient.create({ingredient: params["ingredient13"]})
  i14 = Ingredient.create({ingredient: params["ingredient14"]})
  i15 = Ingredient.create({ingredient: params["ingredient15"]})
  
  Recipe.create({name: recipe, instructions: instructions, category_id: c, user_id: name_id})
  
  @u = User.find(name_id)
  
  @u.recipes << i1
  @u.recipes << i2
  @u.recipes << i3
  @u.recipes << i4
  @u.recipes << i5
  @u.recipes << i6
  @u.recipes << i7
  @u.recipes << i8
  @u.recipes << i9
  @u.recipes << i10
  @u.recipes << i11
  @u.recipes << i12
  @u.recipes << i13
  @u.recipes << i14
  @u.recipes << i15
  
  binding.pry
  
  @u = User.find(name_id)
  @u_recipes.each do |r|
    r.ingredients << i1
  
  erb :user_recipes
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
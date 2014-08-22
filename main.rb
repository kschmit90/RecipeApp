# Index, show, new, create, edit, update, delete

require 'rubygems'
require 'bundler'

Bundler.require

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

  erb :'users/create_user'
end

post '/new_user' do
  @user = User.create(name: params['name'])
  @names = User.all

  erb :'users/new_user'
end

get '/user_page' do
  @user = User.find(params[:user])

  erb :'users/user_page'
end

get '/user/edit/:u_id' do
  @user = User.find(params[:u_id])

  erb :'users/edit_user'
end

get '/user/:u_id' do
  @user = User.find(params[:u_id])

  erb :'users/user_page'
end

get '/user/:u_id/edit_recipes' do
  u_id = params[:u_id]
  @user = User.find(u_id)

  erb :'recipes/edit_recipes'
end

get '/update_user/:u_id' do
  @user = User.find(params[:u_id])
  @user.update_attributes(name: params[:name])

  erb :'users/user_page'
end

get '/edit/recipe/:r_id' do
  @recipe = Recipe.find(params[:r_id])
  @categories = Category.all

  erb :'recipes/edit_recipe'
end

get '/updated_recipe/:r_id' do

  erb :'recipes/updated_recipe'
end

get '/user/delete/:u_id' do
  User.delete(params[:u_id])

  erb :'users/delete_user'
end

get '/create_recipe/user/:u_id' do
  @user = User.find(params[:u_id])
  @categories = Category.all

  erb :'recipes/create_recipe'
end

post '/save_recipe/user/:u_id' do
  u = params[:u_id]
  r = params[:recipe]
  i = params[:instructions]
  c = params[:categorylist]

  @user = User.find(u)
  @recipe = Recipe.create(name: r, instructions: i, category_id: c, user_id: u)
  @category = Category.find(c).name

  params.each do |k, v|

    next unless k.length <= 2 && v.length > 1

    new_ing = Ingredient.create(ingredient: v)
    @recipe.ingredients << new_ing unless @recipe.ingredients.include? new_ing

  end

  erb :'recipes/new_recipe_page'
end

get '/user_recipes' do
  u_id = params['id']
  @user = User.find(u_id)

  erb :'users/user_recipes'
end

get '/recipe_search' do
  @n = params['search']
  @recipes = Recipe.where("name LIKE '%#{@n}%'")

  erb :search
end

get '/recipe_page/:id' do
  r_id = params['id']
  @recipe = Recipe.find(r_id)

  erb :'recipes/recipe_page'
end

get '/recipes_by_category' do
  c_id = params['category']
  @category = Category.find(c_id)

  erb :'categories/category_search'
end

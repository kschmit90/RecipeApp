get '/user/:u_id/edit_recipes' do
  @names = User.all
  u_id = params[:u_id]
  @user = User.find(u_id)

  erb :'recipes/edit_recipes'
end

get '/edit/recipe/:r_id' do
  @names = User.all
  @recipe = Recipe.find(params[:r_id])
  @categories = Category.all

  erb :'recipes/edit_recipe'
end

get '/updated_recipe/:r_id' do
  @names = User.all

  erb :'recipes/updated_recipe'
end

get '/create_recipe/user/:u_id' do
  @names = User.all
  @user = User.find(params[:u_id])
  @categories = Category.all

  erb :'recipes/create_recipe'
end

post '/save_recipe/user/:u_id' do
  @names = User.all
  
  u = params[:u_id]
  r = params[:recipe_name]
  i = params[:instructions]
  c = params[:categorylist]

  @user = User.find(u)
  @recipe = Recipe.create(name: r, instructions: i, category_id: c, user_id: u)
  @category = Category.find(c).name

  params.each do |k, v|

    if k.length <= 2 && v.length > 1
      ing = Ingredient.new(ingredient: v)
      if ing.valid? 
        ing.save 
        @recipe.ingredients << ing unless @recipe.ingredients.include? ing
      else
        ing = Ingredient.where(ingredient: v)
        @recipe.ingredients << ing unless @recipe.ingredients.include? ing
      end
    end
    
  end
  
  @ingredients = @recipe.ingredients

  erb :'recipes/new_recipe_page'
end

get '/recipe_page/:id' do
  @names = User.all
  r_id = params['id']
  @recipe = Recipe.find(r_id)

  erb :'recipes/recipe_page'
end

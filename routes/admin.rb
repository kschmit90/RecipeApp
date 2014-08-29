get '/admin' do
  @names = User.all

  erb :'admin'
end

get '/admin/user_admin' do
  @names = User.all
  
  erb :'admin/user_admin/user_admin'
end

get '/admin/edit_user' do
  @names = User.all
  
  erb :'admin/user_admin/user_edit'
end

get '/admin/recipe_admin' do
  @names = User.all
  
  erb :'admin/recipe_admin/recipe_admin'
end

get '/admin/edit_recipe' do
  @names = User.all
  
  erb :'admin/recipe_admin/recipe_edit'
end

get '/admin/ingredient_admin' do
  @names = User.all
  
  erb :'admin/ingredient_admin/ingredient_admin'
end

get '/admin/edit_ingredient' do
  @names = User.all
  
  erb :'admin/ingredient_admin/ingredient_edit'
end

get '/admin/category_admin' do
  @names = User.all
    
  erb :'admin/category_admin/category_admin'
end

get '/admin/edit_category' do
  @names = User.all
  
  erb :'admin/category_admin/category_admin'
end






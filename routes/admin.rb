get '/admin' do
  @names = User.all

  erb :'admin'
end

get '/admin/user_admin' do
  @names = User.all
  
  erb :'user_admin'
end

get '/admin/edit_user' do
  @names = User.all
  
  erb :'user_edit'
end

get '/admin/recipe_admin' do
  @names = User.all
  
  erb :'recipe_admin'
end

get '/admin/edit_recipe' do
  @names = User.all
  
  erb :'recipe_edit'
end

get '/admin/ingredient_admin' do
  @names = User.all
  
  erb :'ingredient_admin'
end

get '/admin/edit_ingredient' do
  @names = User.all
  
  erb :'ingredient_edit'
end

get '/admin/category_admin' do
  @names = User.all
    
  erb :'category_admin'
end

get '/admin/edit_category' do
  @names = User.all
  
  erb :'category_admin'
end






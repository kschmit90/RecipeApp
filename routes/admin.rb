get '/admin' do
  @names = User.all

  erb :'admin'
end

get '/admin/user_admin' do
  @names = User.all
  
  erb :'user_admin'
end

get '/admin/recipe_admin' do
  @names = User.all
  
  erb :'recipe_admin'
end

get '/admin/ingredient_admin' do
  @names = User.all
  
  erb :'ingredient_admin'
end

get '/admin/category_admin' do
  @names = User.all
    
  erb :'category_admin'
end






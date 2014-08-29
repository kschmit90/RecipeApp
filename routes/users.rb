get '/create_user' do
  @names = User.all

  erb :'users/create_user'
end

post '/new_user' do
  @user = User.create(name: params['name'])
  @names = User.all

  erb :'users/new_user'
end

get '/user_page' do
  @names = User.all
  @user = User.find(params[:user])

  erb :'users/user_page'
end

get '/user/edit/:u_id' do
  @names = User.all
  @user = User.find(params[:u_id])

  erb :'users/edit_user'
end

get '/user/:u_id' do
  @names = User.all
  @user = User.find(params[:u_id])

  erb :'users/user_page'
end

get '/update_user/:u_id' do
  @names = User.all
  @user = User.find(params[:u_id])
  @user.update_attributes(name: params[:name])

  erb :'users/user_page'
end

get '/user_recipes' do
  @names = User.all
  u_id = params['id']
  @user = User.find(u_id)

  erb :'users/user_recipes'
end

get '/user/delete/:u_id' do
  @names = User.all
  User.delete(params[:u_id])

  erb :'users/delete_user'
end

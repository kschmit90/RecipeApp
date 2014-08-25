get '/recipes_by_category' do
  c_id = params['category']
  @category = Category.find(c_id)

  erb :'categories/category_search'
end

get '/add_category' do
  
  erb :'categories/add_category'
end

post '/new_category' do
  @category = Category.create(name: params[:cat])
  
  erb :'categories/new_category'
end

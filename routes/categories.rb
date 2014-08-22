get '/recipes_by_category' do
  c_id = params['category']
  @category = Category.find(c_id)

  erb :'categories/category_search'
end

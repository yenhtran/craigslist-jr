get '/' do
  # Look in app/views/index.erb

  erb :index
end

get '/:category' do
  @category = Category.where(name: "#{params[:category]}")
  @articles = []
  @category.first.articles.each do |article|
    @articles << article
  end
  erb :category
end

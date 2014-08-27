get '/' do
  # Look in app/views/index.erb

  erb :index
end

get '/edit' do
  @key = params[:key]
  erb :edit
end

post '/edit' do
  @key = params[:key]
  p params
  @article = Article.where(key: "#{params[:key]}").first
  @article.update_attributes(:name => "#{params[:name]}",
                  :description => "#{params[:description]}",
                  :price => "#{params[:price]}",
                  :email => "#{params[:email]}",
                  :key => "#{@key}")
  redirect to ('/')
end

get '/:category' do
  @category = Category.where(name: "#{params[:category].capitalize}")
  @articles = []
  @category.first.articles.each do |article|
    @articles << article
  end
  erb :category
end

get '/:category/new_article' do
  erb :article
end

post '/:category/new_article' do
  @key = rand(5..100)
  @article = Article.create({:name => "#{params[:name]}",
                  :description => "#{params[:description]}",
                  :price => "#{params[:price]}",
                  :email => "#{params[:email]}",
                  :key => "#{@key}"})
  redirect to ("/edit?key=#{@key}")
end

get '/:category/:article' do
  @current_article = Article.where(name: "#{params[:article]}").first
  erb :article
end






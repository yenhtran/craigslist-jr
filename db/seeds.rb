require 'faker'
require_relative '../app/models/article'
require_relative '../app/models/category'

module CategoryImporter

  def self.category_creator(category_attributes)
    new_category = Category.create(category_attributes)
  end
end

module ArticleImporter

  def self.article_creator
    9.times do
      article_attributes = {:name => Faker::Lorem.word,
        :description => Faker::Lorem.sentence,
        :price => Faker::Number.digit,
        :email => Faker::Internet.email,
        :category_id => rand(1..3)}
      Article.create(article_attributes)
      end
  end
end


CategoryImporter.category_creator(name: "Housing")
CategoryImporter.category_creator(name: "Auto")
CategoryImporter.category_creator(name: "Antiques")

ArticleImporter.article_creator

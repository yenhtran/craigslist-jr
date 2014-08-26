class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |col|
      col.string :name
      col.string :description
      col.integer :price
      col.string :email

      col.timestamps

      col.belongs_to :category
    end
  end
end

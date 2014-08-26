class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |col|
      col.string :name
      col.timestamps
    end
  end
end

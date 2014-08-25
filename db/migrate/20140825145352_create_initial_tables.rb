class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end
    
    create_table :ingredients do |t|
      t.string :ingredient
    end
    
    create_table :users do |t|
      t.string :name
    end
    
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :category_id
      t.integer :user_id
    end
    
    create_table :ingredients_recipes, :primary_key => false do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
    end
  end
end

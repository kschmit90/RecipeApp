# Category ActiveRecord Model
#
# Stores Category of a Recipe, Categories have many Recipes
class Category < ActiveRecord::Base
  has_many :recipes
end

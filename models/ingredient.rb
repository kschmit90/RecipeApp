# Ingredient ActiveRecord Model
#
# Stores Ingredient of a Recipe
# every Recipe has and belongs to many Ingredients.
class Ingredient < ActiveRecord::Base
  validates_uniqueness_of :ingredient
  validates_presence_of :ingredient
  has_and_belongs_to_many :recipes
end

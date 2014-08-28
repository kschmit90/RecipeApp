# Ingredient ActiveRecord Model
#
# Stores Ingredient of a Recipe
# every Recipe has and belongs to many Ingredients.
class Ingredient < ActiveRecord::Base
  validates :ingredient, uniqueness: true
  validates :ingredient, presence: true
  has_and_belongs_to_many :recipes
end

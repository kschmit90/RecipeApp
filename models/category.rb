# Category ActiveRecord Model
#
# Stores Category of a Recipe, Categories have many Recipes
class Category < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :recipes
end

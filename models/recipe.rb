# Recipe ActiveRecord model
#
# Stores Recipe of a Category and a User
# each User has many Recipies and each Category has many recipes
class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :ingredients
end

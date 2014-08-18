# User ActiveRecord Model
#
# Stores Users who have many Recipies.
class User < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :recipes
end

# User ActiveRecord Model
#
# Stores Users who have many Recipies.
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :recipes
end



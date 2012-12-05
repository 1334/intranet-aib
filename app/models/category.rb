class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :projects , through: :categorizations

  attr_accessible :name
end

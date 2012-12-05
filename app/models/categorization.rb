class Categorization < ActiveRecord::Base
  belongs_to :project
  belongs_to :category
  # attr_accessible :title, :body
end

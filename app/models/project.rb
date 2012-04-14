class Project < ActiveRecord::Base
  attr_accessible :code, :description, :name
  validates :code, code_format: true
  validates :name, presence: true
end

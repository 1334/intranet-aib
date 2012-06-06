class Diary < ActiveRecord::Base
  belongs_to :project
  has_many :entries
  # attr_accessible :title, :body
end

class Diary < ActiveRecord::Base
  belongs_to :trackable, polymorphic: true
  has_many :entries
  # attr_accessible :title, :body
end

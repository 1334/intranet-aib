class Participant < ActiveRecord::Base
  has_many :collaborations
  has_many :projects, through: :collaborations

  attr_accessible :name
end

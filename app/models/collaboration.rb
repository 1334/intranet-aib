class Collaboration < ActiveRecord::Base
  belongs_to :project
  belongs_to :participant
  attr_accessible :role
end

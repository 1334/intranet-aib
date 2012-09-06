class Timesheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :date, :hours
  serialize :hours
end

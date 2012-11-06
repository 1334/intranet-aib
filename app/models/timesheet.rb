class Timesheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :daily_hours, :date, :total_hours, :user, :project

  validates :project_id, uniqueness: { scope: [:date, :user_id] } 
  validates_presence_of :project_id
  validates_presence_of :user_id
  validates_presence_of :date

end

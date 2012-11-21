class Timesheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :daily_hours, :date, :total_hours, :user, :project

  after_initialize :init_daily_hours

  validates :project_id, uniqueness: { scope: [:date, :user_id] } 
  validates_presence_of :project_id
  validates_presence_of :user_id
  validates_presence_of :date

  serialize :daily_hours

  private

  def init_daily_hours
    self.daily_hours ||= init_daily_hours_array
  end

  def init_daily_hours_array
    Array.new(32,0.0)
  end
end

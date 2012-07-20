class Timesheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :date, :hours
  serialize :hours

  def initialize
    super
    initialize_hours
  end

private

  def initialize_hours
    self.hours = []
    32.times { self.hours << 0 }
  end
end

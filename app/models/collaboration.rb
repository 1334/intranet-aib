class Collaboration < ActiveRecord::Base
  belongs_to :project
  belongs_to :participant

  attr_accessible :role, :participant_name

  ROLES = [:coauthor, :colaborator, :client, :promoter, :builder]

  def participant_name
    participant.try(:name)
  end

  def participant_name=(name)
    self.participant = Participant.find_or_create_by_name(name) if name.present?
  end
end

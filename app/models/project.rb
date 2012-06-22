class Project < ActiveRecord::Base
  extend FriendlyId
  has_one :diary, as: :trackable
  has_many :collaborations
  has_many :participants, through: :collaborations

  friendly_id :code

  attr_accessible :code, :name, :description, :status, :commission, :address, :city, :state, :country, :started_at, :ended_at, :gfa, :exterior_area, :budget, :collaborations_attributes

  accepts_nested_attributes_for :collaborations, reject_if: proc { |attributes| attributes['participant_name'].blank? }
  
  validates :code, code_format: true, presence: true
  validates :name, presence: true

end

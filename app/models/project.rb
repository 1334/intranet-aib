class Project < ActiveRecord::Base
  extend FriendlyId
  has_one :diary, as: :trackable
  has_many :collaborations
  has_many :participants, through: :collaborations

  friendly_id :code

  attr_accessible :code, :description, :name, :collaborations_attributes

  accepts_nested_attributes_for :collaborations
  
  validates :code, code_format: true
  validates :name, presence: true
  validates :code, presence: true
end

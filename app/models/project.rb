class Project < ActiveRecord::Base
  extend FriendlyId
  has_one :diary, as: :trackable

  friendly_id :code

  attr_accessible :code, :description, :name
  validates :code, code_format: true
  validates :name, presence: true
  validates :code, presence: true
end

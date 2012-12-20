class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :categorizations
  has_many :projects , through: :categorizations

  friendly_id :name

  attr_accessible :name, :project_ids

  validates_presence_of :name
end

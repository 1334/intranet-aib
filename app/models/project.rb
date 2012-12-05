class Project < ActiveRecord::Base
  extend FriendlyId

  has_one :diary, as: :trackable
  has_many :collaborations, dependent: :destroy
  has_many :participants, through: :collaborations
  has_many :categorizations
  has_many :categories , through: :categorizations

  friendly_id :code
  
  translates :name, :description

  attr_accessible :code, :name, :description, :status, :commission, :address, :city, :state, :country, :start_year, :end_year, :gfa, :exterior_area, :budget, :published, :collaborations_attributes, :category_ids

  accepts_nested_attributes_for :collaborations, reject_if: proc { |attributes| attributes['participant_name'].blank? }
  accepts_nested_attributes_for :translations
  accepts_nested_attributes_for :categorizations
  
  validates :code, code_format: true, presence: true
  validates :name, presence: true

  STATUS = [:competition, :predesign, :sechematic_design, :design_devlopment, :final_design, :building, :built]
  COMMISSION = [:public, :private]

  default_scope order: "code dESC"

  scope :published, where(published: true)

  class Translation
    attr_accessible :locale
  end

end


class Project < ActiveRecord::Base
  include MasterConcerns

  belongs_to :division
  belongs_to :client
  belongs_to :manager, foreign_key: :manager_id, class_name: 'Employee'

  has_many :timesheets, dependent: :restrict_with_error
  has_many :pipelines, dependent: :restrict_with_error

  validates_presence_of :division_id, :client_id, :code, :name
  validates_uniqueness_of :code
end

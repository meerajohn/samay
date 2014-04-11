class Department < ActiveRecord::Base
  include MasterConcerns

  belongs_to :manager, foreign_key: :manager_id, class_name: 'Employee'
  has_many :employees, dependent: :restrict_with_error

  validates_presence_of :code, :name, :kind
  validates_uniqueness_of :code
end

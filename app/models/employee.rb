class Employee < ActiveRecord::Base
  include MasterConcerns

  mount_uploader :photo, EmployeeUploader

  belongs_to :department
  belongs_to :user

  has_one :address, as: :addressable, dependent: :destroy
  has_many :timesheets, dependent: :restrict_with_error
  has_many :pipelines, dependent: :restrict_with_error

  accepts_nested_attributes_for :address, allow_destroy: true

  validates_presence_of :code, :name, :designation, :department_id, :manager_id
  validates_uniqueness_of :code
end

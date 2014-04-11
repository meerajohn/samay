class Division < ActiveRecord::Base
  include MasterConcerns

  has_many :projects, dependent: :restrict_with_error

  validates_presence_of :parent_id, :code, :name
  validates_uniqueness_of :code
end

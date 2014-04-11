class Client < ActiveRecord::Base
  include MasterConcerns

  mount_uploader :photo, PhotoUploader

  belongs_to :division

  has_one :address, as: :addressable, dependent: :destroy
  has_many :projects, dependent: :restrict_with_error

  accepts_nested_attributes_for :address, allow_destroy: true

  validates_presence_of :code, :name, :contact
  validates_uniqueness_of :code
end

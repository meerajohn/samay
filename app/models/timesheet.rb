class Timesheet < ActiveRecord::Base
  include Workflow
  workflow_column :status

  belongs_to :project
  belongs_to :division
  belongs_to :employee

  validates_presence_of :project_id, :employee_id, :entry_date, :entry_period, :hours
  validate :entry_date, if: proc { |i| i.entry_date.present? }

  after_initialize :init_dates
  scope :open, -> { where(status: :completed) }

  workflow do
    state :completed do
      event :cancel,  transitions_to: :canceled
      event :close,  transitions_to: :closed
    end
    state :canceled
    state :closed

    on_error do |error, from, to, event, *args|
      errors[:base] << error
    end
  end

private
   def init_dates
     self.entry_date ||= Date.today
   end
end

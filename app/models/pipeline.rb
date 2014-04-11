class Pipeline < ActiveRecord::Base
  include Workflow
  workflow_column :status

  belongs_to :project
  belongs_to :division
  belongs_to :employee

  validates_presence_of :project_id, :division_id, :employee_id, :reserved_date
  validate :valid_reserved_date, if: proc { |r| r.reserved_date.present? }

  scope :open, -> { where(status: :reserved) }

  after_initialize :init_reserved_date

  workflow do
    state :reserved do
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

  def valid_reserved_date
    errors.add(:reserved_date, 'Reservation date should not be in future.') \
      if self.reserved_date > Date.today
  end

  def init_reserved_date
    self.reserved_date ||= Date.today
  end
end

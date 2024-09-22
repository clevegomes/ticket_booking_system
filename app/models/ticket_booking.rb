class TicketBooking < ApplicationRecord
 belongs_to :user
  belongs_to :event

  validates :tickets, presence: true, numericality: { greater_than: 0 }

  validate :tickets_available

  def tickets_available
    return if tickets.blank?
    event.with_lock do
      if tickets > event.remaining_tickets
        errors.add(:tickets, 'are not available in sufficient quantity')
      end
    end
  end
end

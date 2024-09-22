class Event < ApplicationRecord
  belongs_to :user
  has_many :ticket_bookings, dependent: :destroy

  validates :name, :description, :location, :date, :total_tickets, presence: true


  def remaining_tickets
    total_tickets - ticket_bookings.sum(:tickets)
  end
end

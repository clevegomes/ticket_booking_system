class TicketBookingsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event, only: [:create, :new]

  def new
      @ticket_booking = @event.ticket_bookings.build
  end

  def create
    @ticket_booking = @event.ticket_bookings.build(booking_params.merge(user: current_user))

    if @ticket_booking.save
      redirect_to events_path, notice: 'Tickets have been booked successfully.'
    else
      redirect_to my_bookings_url, alert: 'Unable to book your tickets.'
    end
  end





  private


  def set_event
    @event = Event.find_by(id: params[:event_id])
    unless @event
      render json: { error: 'Event not found' }, status: :not_found
    end
  end

  def booking_params
    params.require(:ticket_booking).permit(:tickets)
  end
end

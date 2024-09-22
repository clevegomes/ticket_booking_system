class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Rails.cache.fetch('events_all', expires_in: 12.hours) do
      Event.all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: 'Event created successfully.'
    else
      render :new
    end
  end

  def my_events
    @events = current_user.events
    render template: 'events/index'
  end

  def my_ticket_bookings
    @ticket_bookings = current_user.ticket_bookings
    render template: 'ticket_bookings/index'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :total_tickets)
  end
end
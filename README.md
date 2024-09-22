# Ticket Booking System

A simple event ticketing system built with Ruby on Rails. This system allows users to register, create events, book tickets, and view upcoming events.

## Features

- **Event Creation**: Admins can create and manage events, including setting dates, descriptions, and ticket availability.
- **Ticket Booking**: Users can browse available events and book tickets.
- **Event Listings**: Users can view upcoming events and the details for each event.

## Installation

### Prerequisites

- Ruby 3.0+
- Rails 7.0+
- PostgreSQL

### Setup Instructions

1. Clone the repository:

   ```bash
   git clone git@github.com:clevegomes/ticket_booking_system.git
   cd ticket_booking_system
   
   bundle install
   rails db:create
   rails db:migrate
   rails db:seed
   
   rails server



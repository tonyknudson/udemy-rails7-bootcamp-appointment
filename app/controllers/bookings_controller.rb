class BookingsController < ApplicationController
    before_action :set_booking, only: %i[show edit update]
    def index
        @bookings = Booking.all
    end

    def show
    end

    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        respond_to do |format|
            if @booking.save
                format.html { redirect_to booking_url(@booking), notice: "Booking created successfully" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @booking.update(booking_params)
                format.html { redirect_to booking_url(@booking), notice: "Booking updated successfully" }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end
    
    private
    
    def set_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:room_id, :start, :end, :purpose)
    end
end

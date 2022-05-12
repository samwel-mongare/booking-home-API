class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update destroy]
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    return booking_not_found unless @booking

    render json: @booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    return render json: @booking.errors, status: :unprocessable_entity unless @booking.save

    render json: @booking, status: :created
  end

  def update
    return render json: @booking.errors, status: :unprocessable_entity unless @booking.update(booking_params)
  end

  def destroy
    return render json @booking.errors, status: :unprocessable_entity unless @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.includes(:apartment).find_by(id: params[:id])
  end

  def booking_params
    params.require(:booking).permit(:apartment_id, :user_id)
  end

  def booking_not_found
    render json: { error: 'Booking not found' }, status: :not_found
  end
end
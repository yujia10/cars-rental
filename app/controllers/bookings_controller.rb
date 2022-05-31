class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(list_params)
    @booking.car =  @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car), notice: 'You are successful'
    else
      render :new
    end
  end

  def car_bookings
    @bookings = current_user.car_bookings
  end

  def my_bookings
    @bookings = current_user.my_bookings
  end

  private

  def list_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end
end

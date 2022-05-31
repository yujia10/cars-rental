class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    authorize @booking
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(list_params)
    authorize @booking
    if @booking.start_date <  @booking.end_date
      @booking.car =  @car
      @booking.user = current_user
      if @booking.save
        redirect_to my_bookings_bookings_path, notice: 'You are successful'
      else
        render :new
      end
    else
      render :new
    end
  end

  def car_bookings
    @bookings = current_user.car_bookings
    authorize @bookings
  end

  def my_bookings
    @booking = current_user.my_bookings
    authorize @booking
  end

  private

  def list_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end
end

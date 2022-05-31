class BookingsController < ApplicationController

  skip_after_action :verify_authorized, only: [:index, :car_bookings, :my_bookings]
  after_action :verify_policy_scoped, only: [:index, :car_bookings, :my_bookings]

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
     @bookings = policy_scope(Booking).where(car: current_user.cars)
  end
  def my_bookings
     @bookings = policy_scope(Booking).where(user: current_user)
  end

# Yaron code
#     @bookings = current_user.car_bookings
#     authorize @bookings
#   end

#   def my_bookings
#     @booking = current_user.my_bookings
#     authorize @booking


  private

  def list_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end
end

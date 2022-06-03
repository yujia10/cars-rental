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
    format_dates if list_params[:date]
    calculate_total_price if list_params[:date]
    authorize @booking
    @booking.car =  @car
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_bookings_path, notice: 'You are successful'
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

  private

  def format_dates
    @booking.start_date = Date.parse(list_params[:date][0..9])
    @booking.end_date = Date.parse(list_params[:date][-10..-1])
  end

  def calculate_total_price
    days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @car.price_day * days
  end

  def list_params
    params.require(:booking).permit(:car_id, :date, :start_date, :end_date)
  end
end

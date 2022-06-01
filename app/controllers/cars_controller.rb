class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:my_cars]
  after_action :verify_policy_scoped, only: [:index, :my_cars]

  def index
    if current_user.nil?
      @cars = policy_scope(Car)
    else
      @cars = policy_scope(Car).where.not(user: current_user)
    end
  end

  def show
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(list_params)
    authorize @car
    @car.user = current_user
    if @car.save
      redirect_to my_cars_cars_path, notice: 'You are successful'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @car.update(list_params)
    if @car.update(list_params)
      redirect_to my_cars_cars_path
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to my_cars_cars_path
  end

  def my_cars
    @cars = policy_scope(Car).where(user: current_user)
  end


  private

  def find_car
    @car = Car.find(params[:id])
    authorize @car
  end


  def list_params
    params.require(:car).permit(:make, :model, :price_day)
  end
end

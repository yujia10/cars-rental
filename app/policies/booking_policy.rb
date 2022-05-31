class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def new?
    return true
  end

  def my_bookings?
    return true
  end

  def car_bookings?
    return true
  end
end

class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?
    true
  end

  def show?
    true
  end

  def update?
    # if user == record.user
    #   true
    # else
    #   false
    # end
    user == record.user || user.admin
  end

  def destroy
    user == record.user || user.admin
  end
end

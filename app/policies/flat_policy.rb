class FlatPolicy < ApplicationPolicy
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
    true

   # user == record.user || user.admin
  end

  def destroy
    true
   # user == record.user || user.admin
  end

end

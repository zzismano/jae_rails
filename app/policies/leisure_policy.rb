class LeisurePolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

  end

  def home?
    true
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end

  def dashboard?
    user.admin
  end

  def filme?
    true
  end

  def musica?
    true
  end

  def teatro?
    true
  end

  def danca?
    true
  end

  def evento?
    true
  end

  def festa?
    true
  end

  def expo?
    true
  end

  def mais?
    true
  end
  
  def newsletter_subscription?
    true
  end

end

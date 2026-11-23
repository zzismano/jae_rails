class SponsoredBannerPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      user&.admin? ? scope.all : scope.none
    end
  end

  def index?;   user&.admin?; end
  def new?;     create?;      end
  def create?;  user&.admin?; end
  def edit?;    update?;      end
  def update?;  user&.admin?; end
  def destroy?; user&.admin?; end
end

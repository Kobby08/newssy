class LinkPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    link.user == user
  end

  def destroy?
    link.user == user
  end

  private

  def link
    record
  end
end

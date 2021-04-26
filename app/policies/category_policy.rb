class CategoryPolicy < ApplicationPolicy
  def create?
    user.present? && user.channel.present?
  end

  def update?
    category.user == user
  end

  def destroy?
    category.user == user
  end

  private

  def category
    record
  end
end

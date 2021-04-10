class ChannelPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && !user.channel.present?
  end

  def update?
    channel.user == user
  end

  def destroy?
    channel.user == user
  end

  private

  def channel
    record
  end
end

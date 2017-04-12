class PostPolicy < ApplicationPolicy
  def update?
    record.user.id == user.id || admin_types.include?(user.type)
  end
end
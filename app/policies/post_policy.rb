class PostPolicy < ApplicationPolicy
  def update?
    if admin?
      return true
    elsif samePostUser? && !postApproved?
      return true
    end
    return false
  end

  def destroy?
    update?
  end

  def admin?
    admin_types.include?(user.type)
  end

  def samePostUser?
    record.user.id == user.id
  end

  def postApproved?
    record.approved?
  end
end
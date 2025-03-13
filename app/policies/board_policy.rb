class BoardPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    has_access?(:view_only)
  end

  def new?
    has_access?(:edit)
  end
  def edit?
    has_access?(:edit)
  end
  def update?
    has_access?(:edit)
  end
  def destroy?
    has_access?(:edit)
  end

  def has_access?(required_role)
    permission = user.board_permissions.find_by(board: record)
    return false unless permission

    BoardPermission.roles[permission.role] >= BoardPermission.roles[required_role.to_s]
  end
end

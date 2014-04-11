class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all if user.has_role? :admin
    can :read, :all if user.has_role? :auditor

    if user.has_role? :manager
      can :manage, :all
      cannot :manage, :settings
      cannot :manage, User
    end

    if user.has_role? :employee
      can :perform, :search
      can :read, :report
      can :read, Project
    end
  end
end

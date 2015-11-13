class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # :manage allows all the actions, so you do noth ave to write them one by one.
    can :manage, User, id: user.id
  end
end

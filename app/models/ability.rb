class Ability
  include CanCan::Ability

  def initialize user
    if user.has_role? :admin
      can :manage, :all
    else
      can :manage, Question, user_id: user.id
      can :manage, Exam, user_id: user.id
      cannot :destroy, Exam
    end
  end
end

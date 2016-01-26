class Ability
  include CanCan::Ability

  def initialize(user)
     if user.role_is? :admin
        can :manage, :all 
      elsif user.role_is? :blogger
        can :read, Post 
        can :create, Post
        can :update, Post do |post|
            post.try(:user) == user
        end
        can :destroy, Post do |post|
            post.try(:user) == user
        end
      elsif user.role_is? :viewer
        can :read, Post
      end
  end
  
end

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    # // The visitor and user
    # // A registered user or a new user

     user ||= User.new
 
     can :read, Post

    #  // if a user is logged in

     if user.present?
       if user.admin?
        #  // admins have the privilege to manage everything
         can :manage, Post
         can :manage, :all
       else
      # // other users are given permission to read and edit their own posts.
         can :read, Post
        #  // They cannot read any hidden articles
         cannot :read, Post, hidden: true
       end
     else
      #  // user not signed in should view a sign_up page:
       can :read, :sign_up
     end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

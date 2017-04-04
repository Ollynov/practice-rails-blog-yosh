class Ability
  include CanCan::Ability

  def initialize(user)
    
   user ||= User.new #  guest user who is not logged in
   can :read, Posts
   
   can [:create, :update, :destroy], Post do |post|
     post.user == user
   end
  end
end

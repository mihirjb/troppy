class Ability
  include CanCan::Ability
 
  def initialize(user)
     user ||= User.new # guest user (not logged in)
     if user.role? :administrator
       can :manage, :all
     elsif user.role? :creator 
          can [:read, :create], Lr
          can :read, Payvoucher
        elsif user.role? :payer
              can [:read, :create], Payvoucher
              can :read, Lr
            else
              can :read, :all
            end
      
  
  
end
  
end
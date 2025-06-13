class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    can :create, Chat
    can :read, Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end
    can [:update, :destroy], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end

    can [:read, :update, :destroy], User, id: user.id
  end
end

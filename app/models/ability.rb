class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # Lectura global
    can :read, :all

    # Mensajes
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    # Chats
    can :create, Chat
    can [:update, :destroy], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end
  end
end

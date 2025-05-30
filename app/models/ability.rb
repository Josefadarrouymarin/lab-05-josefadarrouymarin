class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # Lectura general
    can :read, :all

    # Permisos sobre Mensajes
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    # Permisos sobre Chats
    can :create, Chat
    can [:update, :destroy], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end

    # Permisos sobre su propia cuenta de usuario
    can [:read, :update, :destroy], User, id: user.id
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.role}_abilities", user)
  end

  def admin_abilities(user)
    alias_action :create, :read, :update, to: :crud
    can :crud, Auction, created_by: user.id
  end

  def bidder_abilities(user)
    alias_action :create, :read, :update, to: :crud
    can :crud, Bid, user_id: user.id
    can :read, Auction
  end

  def to_list
    rules.map do |rule|
      object = { actions: rule.actions, subject: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = rule.conditions unless rule.base_behavior
      object
    end
  end

end
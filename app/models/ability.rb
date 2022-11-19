# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:

    user ||= User.new #guest user (not logged in)

    #if user.admin? temp update as we do not have admin column in db yet
    if user.present?
      can :manage, :all
    else
      can :read, :all
    end

    
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    #:read is an alias for :index and :show
    #alias_action :index, :show, :to => :read

    alias_action :create, :read, :update, :delete, :to => :crud


    can :crud, Order do |order|
      user == order.user
    end

    can :crud, Rating do |rating|
      user == rating.user #|| answer.question.user
    end

    can :crud, Review do |review|
      user == review.user #|| answer.question.user
    end

    can :crud, Recipe do |recipe|
      user == recipe.user
    end

    can :create, Rating do |rating| #maybe should be |recipe| instead?
      user.persisted? && recipe.user != user
      #checks if the user is in the database
      #does not allow the recipe owner to like their own recipe
    end

    can :create, Review do |review| #maybe should be |recipe| instead?
      user.persisted? && recipe.user != user
      #checks if the user is in the database
      #does not allow the recipe owner to like their own recipe
    end
  

    can :destroy, Rating do |rating|
      rating.user == user || recipe.user
    end

    can :destroy, Review do |review|
      review.user == user || recipe.user
    end


  end
end
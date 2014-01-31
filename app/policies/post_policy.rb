class PostPolicy < ApplicationPolicy

  attr_accessor :user, :post

  def initializer(user, post)
    @user = user
    @post = post
  end

  def index?
    return @user
  end

  def publish?
    @user.editor?
  end

  def update?
    if @user
      @user.author? || @user.editor?
    end
  end

  def create?
    if @user
      @user.editor?
    end
  end

  def destroy?
    return unless @user.present?
    @user.editor? || @user.author?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end

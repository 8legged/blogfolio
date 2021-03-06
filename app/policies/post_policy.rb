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
      @user.editor? || @user.author? && !record.published?
      # @user.author? || @user.editor?
    # elsif
    #   @user.author? && !record.published?
    end
  end

  def create?
    if @user
      @user.editor? || @user.author?
    end
  end

  def destroy?
    return unless @user.present?
    # @user.editor? || @user.author?
      @user.editor? || @user.author? && !record.published?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user.id)
      else
        scope.where(published: true)
      end
    end
  end
end

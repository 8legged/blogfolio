class CommentsController < ApplicationController
  # before_filter :load_commentable

  def create
    @post = Post.find(params[:post_id])
    @comment =
    @post.comments.create(params[:comment].permit(:author, :content))
    if @comment.save
     flash[:success] = "Comment was successfully created"
     redirect_to post_path(@post)
    else
     render action: 'new'
    end
 end

 def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end

private

  # def load_commentable
  #   @resource, id = request.path.split('/')[1, 2]
  #   @commentable = @resource.singularize.classify.constantize.find(id)
  # end
end

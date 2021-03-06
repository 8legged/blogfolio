class PostsController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, :with => :record_not_found
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post)
    @pub = Post.where(:published => "true").count
    @unpub = Post.where(:published => "false").count
  end

  def show
    @post = Post.find(params[:id])
  end

  def my_posts
    u = current_user
    @posts = Post.where(:author_id => u.id)
    @pub = @posts.where(:published => "true").count
    @unpub = @posts.where(:published => "false").count
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      current_user.posts << @post
      flash[:success] = "Post was successfully created"
      redirect_to @post
    else
      render action: 'new'
    end
  end

  # def create
  #   @post = Post.new(post_params)
  #   authorize @post.save
  #     flash[:success] = "Post was successfully created"
  #     redirect_to @post
  #   else
  #     render action: 'new'
  #   end
  # end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated."
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    # authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:name, :title, :content,(:published if current_user.role == "editor"))
  end

  def record_not_found
    redirect_to posts_url, :alert => "Couldn't find post"
  end
end

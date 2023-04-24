class PostsController < ApplicationController
  before_action :require_login, except: [:index]
  # skip_before_action :require_login, only: [:index]

  def new
    @post = current_user.posts.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_login
    return if user_signed_in?

    flash[:error] = 'You must be logged in to access this section' 
    redirect_to new_user_session_path
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

class PostsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @posts = Post.all
  end

  def create
    post = Post.new(content: params[:content], user: User.find(session[:user_id]))
    if post.valid?
      post.save
      redirect_to "/bright_ideas"
    else
      flash[:errors]=post.errors.full_messages
      redirect_to "/bright_ideas"
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user.alias
    @users_liked = Like.select('users.name, users.alias, users.id').joins(:user).where(post:@post).uniq
    render 'show'
  end

  def destroy
    post = Post.find(params[:post_id])
    user = post.user
    post.destroy if user == current_user
    redirect_to "/bright_ideas"
  end
end

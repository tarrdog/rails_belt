class LikesController < ApplicationController
  def create
    like = Like.new(user: User.find(session[:user_id]), post:Post.find(params[:post_id]))
    if like.valid?
      like.save
      redirect_to "/bright_ideas"
    else
      flash[:errors]=like.errors.full_messages
      redirect_to "/bright_ideas"
    end
  end

  def destroy
  end
end

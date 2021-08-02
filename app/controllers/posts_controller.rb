class PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)

    @post.user_id = current_user.id

    if @post.save
      redirect_to @topic
    else
      render :new
    end

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end

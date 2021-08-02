class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @topic.posts.build
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.views = 0

    if @topic.save
      @post = @topic.posts.new(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to @topic
      else
        @topic.destroy
        render :new
      end
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @topic.views += 1
    @topic.save
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :category_id, :pinned, :closed)
  end

  def post_params
    params.require(:topic).require(:posts).permit(:message)
  end
end

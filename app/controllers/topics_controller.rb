class TopicsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @topic = @user.topics.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @topic = @user.topics.new(topic_params)
    if @topic.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @topic = Topic.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:user_id])
    @topic = Topic.find(params[:id])
    render :edit
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to user_path(@topic.user)
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to user_path(@topic.user)
  end

  private
  def topic_params
    params.require(:topic).permit(:question)
  end
end

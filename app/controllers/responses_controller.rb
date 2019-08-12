class ResponsesController < ApplicationController
  def new
    # binding.pry
    @topic = Topic.find(params[:topic_id])
    @response = @topic.responses.new
    render :new
  end

  def create
    @topic = Topic.find(response_params[:topic_id])
    # binding.pry
    @response = @topic.responses.new(response_params)
    if @response.save
      user = User.find(@topic.user_id)
      # redirect_to user_topic_path(user_id: user.id, id: @topic.id)
      redirect_to user_topic_path(user, @topic)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @topic = Topic.find(params[:id])
    @response = Response.find(params[:id])
    render :show
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @response = Response.find(params[:id])
    render :edit
  end

  def update
    @response = Response.find(params[:id])
    if @response.update(response_params)
      redirect_to topic_path(@response.topic)
    else
      render :edit
    end
  end

  def destroy
  @response = Response.find(params[:id])
  @response.destroy
  redirect_to topic_path(@response.topic)
end

  private
  def response_params
    params.require(:response).permit(:answer, :topic_id)
  end
end

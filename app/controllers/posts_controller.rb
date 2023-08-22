class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    if params[:status]=="activated"
      render json: {message: "activated"}
    else
      render json: {message: "not activated"}
    end
  end 

  def create
    @post = Post.new(set_params)
    if @post.save
      render json: { message:"User Created", data: @post}
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  def set_params
    params.permit(:name,:age,:email)
  end
end
